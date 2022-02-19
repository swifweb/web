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

// TODO: https://developer.mozilla.org/en-US/docs/Web/API/Node
// TODO: https://developer.mozilla.org/en-US/docs/Web/API/Element
// TODO: https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement
extension DOMElement {
    // MARK: - Core Methods
    
    /// Adds the specified childNode argument as the last child to the current node.
    /// If the argument referenced an existing node on the DOM tree,
    /// the node will be detached from its current position and attached at the new position.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Node/appendChild)
    public func appendChild(_ element: DOMElement) {
        #if arch(wasm32)
        _ = domElement.appendChild(element.domElement)
        #endif
        #if WEBPREVIEW
        properties.subElements.append(element)
        #endif
        element.didAddToDOM()
    }
    
    /// Removes the element from the children list of its parent.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Element/remove)
    @discardableResult
    func remove() -> Self {
        #if arch(wasm32)
        domElement.remove.function?.callAsFunction(this: jsValue.object)
        #endif
        return self
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
        #if WEBPREVIEW
        let stringValue: String?
        switch mode {
        case .full: stringValue = value ? "true" : "false"
        case .long: stringValue = value ? key : nil
        case .modern: stringValue = value ? "yes" : "no"
        case .short: stringValue = value ? "" : nil
        }
        if let value = stringValue {
            properties.attributes[key] = value
        } else {
            properties.attributes.removeValue(forKey: key)
        }
        #endif
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
        #if WEBPREVIEW
        properties.attributes[key] = value
        #endif
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
        #endif
    }
}

extension DOMElement {
    public func shutdown() {
        storage.shutdown()
    }
}

public final class DOMElementProperties {
    let uid: String = .shuffledAlphabet(8, letters: "AaBbCcDdEeFfGgJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789")
    
    public lazy var _id = uid
    public lazy var _classes: Set<String> = []

    public internal(set) var subElements: [DOMElement] = []
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
