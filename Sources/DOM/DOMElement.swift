//
//  DOMElement.swift
//  DOM
//
//  Created by Mihael Isaev on 24.02.2021.
//

import WebFoundation

public protocol DOMElementable: Storageable {
    #if arch(wasm32)
    var domElement: JSValue { get set }
    #endif
}

public protocol DOMElement: DOMElementable, AnyElement {
    static var name: String { get }
    
    var properties: DOMElementProperties { get }
    
    func didAddToDOM()
    func didRemoveFromDOM()
    func appendChild(_ element: DOMElement)
    func shutdown()
}

extension DOMElement {
    var name: String { Self.name }
    
    public func didAddToDOM() {}
    public func didRemoveFromDOM() {}
}

extension DOMElement {
    public func appendChild(_ element: DOMElement) {
        #if arch(wasm32)
        _ = domElement.appendChild(element.domElement)
        #else
        if element === self {
            GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
            let el = document.createElement('\(element.name)');
            el.id = '\(element.properties._id)';
            el.style.backgroundColor = 'red';
            document.body.appendChild(el);
            """)
        } else {
            GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
            if (!document.getElementById('\(element.properties._id)')) {
                let el = document.createElement('\(element.name)');
                el.id = '\(element.properties._id)';
                document.getElementById('\(properties._id)').appendChild(el);
            }
            """)
        }
        #endif
        element.didAddToDOM()
    }
    
    // MARK: - Set Attribute

    #if arch(wasm32)
    private func _setAttribute(_ key: String, _ value: JSValue, _ wasmPlain: Bool) {
        if wasmPlain {
            domElement[dynamicMember: key].function?.callAsFunction(this: domElement.object, key, value.jsValue())
        } else {
            domElement[dynamicMember: key] = value.jsValue()
        }
    }
    #endif
    
    func setAttribute(_ key: String, _ value: Bool, _ mode: AttributeBoolMode = .short, wasmPlain: Bool = false) {
        #if arch(wasm32)
        _setAttribute(key, value.jsValue(), wasmPlain)
        #else
        let stringValue: String?
        switch mode {
        case .full: stringValue = value ? "true" : "false"
        case .long: stringValue = value ? key : nil
        case .modern: stringValue = value ? "yes" : "no"
        case .short: stringValue = value ? "" : nil
        }
        switch GlobalContext[PreviewMode.self] {
        case .static:
            if let value = stringValue {
                properties.attributes[key] = value
            } else {
                properties.attributes.removeValue(forKey: key)
            }
        case .dynamic:
            GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
            document.getElementById('\(properties._id)').\(key) = '\(value ? "true" : "false")';
            """)
        case .none: break
        }
        #endif
    }
    
    func setAttribute(_ key: String, _ value: Double, wasmPlain: Bool = false) {
        #if arch(wasm32)
        _setAttribute(key, value.jsValue(), wasmPlain)
        #else
        setAttribute(key, "\(value)")
        #endif
    }
    
    func setAttribute(_ key: String, _ value: Int, wasmPlain: Bool = false) {
        #if arch(wasm32)
        _setAttribute(key, value.jsValue(), wasmPlain)
        #else
        setAttribute(key, "\(value)")
        #endif
    }
    
    func setAttribute(_ key: String, _ value: UInt, wasmPlain: Bool = false) {
        setAttribute(key, Int(value))
    }
    
    func setAttribute(_ key: String, _ value: String, wasmPlain: Bool = false) {
        #if arch(wasm32)
        _setAttribute(key, value.jsValue(), wasmPlain)
        #else
        switch GlobalContext[PreviewMode.self] {
        case .static:
            properties.attributes[key] = value
        case .dynamic:
            GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
            document.getElementById('\(properties._id)').\(key) = '\(value)';
            """)
        case .none: break
        }
        #endif
    }
    
    func callFunction(_ name: String, this: Bool = true, args: WebJSValue...) {
        #if arch(wasm32)
        if this {
            domElement[dynamicMember: name].function?.callAsFunction(this: domElement.object, arguments: args.map { $0.webValue })
        } else {
            // TODO: implement global function calling?
//            domElement[dynamicMember: name].function?.callAsFunction(arguments: args.map { $0.webValue })
        }
        #else
        switch GlobalContext[PreviewMode.self] {
        case .static: break
        case .dynamic:
            if this {
                GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
                document.getElementById('\(properties._id)').\(name)(\(args.map { $0.webValue }.joined(separator: ", ")));
                """)
            } else {
                // TODO: implement global function calling?
            }
        case .none: break
        }
        #endif
    }
}

extension DOMElement {
    public func shutdown() {
        storage.shutdown()
    }
}

public final class DOMElementProperties {
    let uid: String = .shuffledAlphabet(8, letters: "AaBbCcDdEeFfGgJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789=")
    
    public lazy var _id = uid
    public lazy var _classes: Set<String> = []

    public private(set) var subElements: [DOMElement] = []
    #if !arch(wasm32)
    public var styles: [String: String] = [:]
    public var attributes: [String: String] = [:]
    #endif
    
    init () {}
}

enum AttributeBoolMode {
    /// like `<audio muted>`
    /// ```html
    /// <audio muted>
    /// ```
    case short
    
    /// like **true/false**
    /// ```html
    /// <p spellcheck="true">Text</p>
    /// ```
    case full
    
    /// like **yes/no**
    /// ```html
    /// <span translate="no">BrandName</span>
    /// ```
    case modern
    
    /// like **checked="checked"**
    /// ```html
    /// <input checked="checked">
    /// ```
    case long
}
