//
//  AnyElement.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AnyElement: class {
    static var name: String { get }
}

protocol _AnyElement: AnyElement, _PreviewRenderable, RenderBuilderContent {
    var uid: String { get }
    var _id: String { get set }
    #if arch(wasm32)
    var domElement: JSValue { get set }
    #endif
    var subElements: [_AnyElement] { get set }
    #if !arch(wasm32)
    var styles: [String: String] { get }
    var attributes: [String: String] { get set }
    #endif
    
    func didAddToDOM()
    func didRemoveFromDOM()
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

extension _AnyElement {
    public var renderBuilderContent: RenderBuilder.Item { .item(self) }
    
    var name: String { Self.name }
    
    func appendChild(_ element: _AnyElement) {
        #if arch(wasm32)
        _ = domElement.appendChild(element.domElement)
        #else
//        if element === self {
//            previewLiveView.executeJS("""
//            let el = document.createElement('\(element.name)');
//            el.id = '\(element.uid)';
//            el.style.backgroundColor = 'red';
//            document.body.appendChild(el);
//            """)
//        } else {
//            previewLiveView.executeJS("""
//            if (!document.getElementById('\(element.uid)')) {
//                let el = document.createElement('\(element.name)');
//                el.id = '\(element.uid)';
//                document.getElementById('\(uid)').appendChild(el);
//            }
//            """)
//        }
        #endif
        element.didAddToDOM()
    }
    
    // MARK: _PreviewRenderable
    
    func renderPreview() -> String {
        #if !arch(wasm32)
        if let s = self as? Stylesheet {
            guard previewMode == .static else { return "" }
            var result = ""
            if s._rules.count > 0 {
                result = "<style id=\"\(uid)\">" + s._rules.map { $0.render() }.joined() + "</style>"
            }
            return result
        } else if let s = self as? Style {
            guard previewMode == .static else { return "" }
            var result = ""
            if s._rules.count > 0 {
                result = "<style id=\"\(uid)\">" + s._rules.map { $0.render() }.joined() + "</style>"
            }
            return result
        }
        let style = styles.map { $0.key + ":" + $0.value }.joined(separator: ";")
        var result = "<\(Self.name) id=\"\(uid)\""
        if style.count > 0 {
            result += " style=\"\(style)\""
        }
        if previewMode == .static {
            attributes.forEach { key, value in
                result += " " + key
                if value.count > 0 {
                    result += "=\"" + value + "\""
                }
            }
        }
        result += ">"
        if previewMode == .static,
           let s = self as? BaseContentElementable,
           s.innerText.count > 0 {
            result += s.innerText
        }
        subElements.forEach {
            result.append($0.renderPreview())
        }
        result.append("</\(Self.name)>")
        return result
        #else
        return ""
        #endif
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
        let stringValue: String?
        switch mode {
        case .full: stringValue = value ? "true" : "false"
        case .long: stringValue = value ? key : nil
        case .modern: stringValue = value ? "yes" : "no"
        case .short: stringValue = value ? "" : nil
        }
        #if arch(wasm32)
        _setAttribute(key, value.jsValue(), wasmPlain)
        #else
        switch previewMode {
        case .static:
            if let value = stringValue {
                attributes[key] = value
            } else {
                attributes.removeValue(forKey: key)
            }
        case .dynamic:
            previewLiveView.executeJS("""
            document.getElementById('\(uid)').\(key) = '\(value ? "true" : "false")';
            """)
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
        switch previewMode {
        case .static:
            attributes[key] = value
        case .dynamic:
            previewLiveView.executeJS("""
            document.getElementById('\(uid)').\(key) = '\(value)';
            """)
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
        switch previewMode {
        case .static: break
        case .dynamic:
            if this {
                previewLiveView.executeJS("""
                document.getElementById('\(uid)').\(name)(\(args.map { $0.webValue }.joined(separator: ", ")));
                """)
            } else {
                // TODO: implement global function calling?
            }
        }
        #endif
    }
}

public protocol WebJSValue {
    #if arch(wasm32)
    var webValue: JSValue { get }
    #else
    var webValue: String { get }
    #endif
}

extension Optional: WebJSValue where Wrapped: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue {
        switch self {
        case .none: return .null
        case .some(let v): return v.webValue
        }
    }
    #else
    public var webValue: String {
        switch self {
        case .none: return "null"
        case .some(let v): return v.webValue
        }
    }
    #endif
}

extension Bool: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Float: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Double: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension String: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { self }
    #endif
}

extension UInt8: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt16: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt32: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt64: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int8: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int16: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int32: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int64: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue() }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

public protocol BaseContentElementable: class {
    init ()
//    init(@BodyBuilder content: @escaping BodyBuilder.Block)
    func buildUI()
    
    @BodyBuilder var body: BodyBuilder.Content { get }
    
    func body(@BodyBuilder content: @escaping BodyBuilder.Block) -> Self
    
    var innerText: String { get set }
    var innerHTML: String { get set }
}

protocol _BaseContentElementable: _AnyElement, BaseContentElementable {
    func postBuildUI()
    func parseBodyBuilderItem(_ item: BodyBuilderItem)
    #if !arch(wasm32)
    var __innerText: String { get set }
    #endif
}

extension BaseContentElementable {
    private var s: _BaseContentElementable? { self as? _BaseContentElementable }
    
    public init(@BodyBuilder content: @escaping BodyBuilder.Block) {
        self.init()
        s?.parseBodyBuilderItem(content().bodyBuilderContent)
    }
    
    @discardableResult
    public func body(@BodyBuilder content: @escaping BodyBuilder.Block) -> Self {
        s?.parseBodyBuilderItem(content().bodyBuilderContent)
        return self
    }
    #if arch(wasm32)
    public var innerText: String {
        get { s?.domElement.innerText.string ?? "" }
        set { s?.domElement.innerText = newValue.jsValue() }
    }
    
    public var innerHTML: String {
        get { s?.domElement.innerHTML.string ?? "" }
        set { s?.domElement.innerHTML = newValue.jsValue() }
    }
    #else
    public var innerText: String {
        get {
            guard let s = s else { return "" }
            switch previewMode {
            case .dynamic: return ""
            case .static: return s.__innerText
            }
        }
        set {
            guard let s = s else { return }
            switch previewMode {
            case .dynamic:
                previewLiveView.executeJS("""
                document.getElementById('\(s.uid)').innerText = '\(newValue)';
                """)
            case .static:
                s.__innerText = newValue
            }
        }
    }
    public var innerHTML: String {
        get { "" }
        set {
            guard let s = s else { return }
            previewLiveView.executeJS("""
            document.getElementById('\(s.uid)').innerHTML = '\(newValue)';
            """)
        }
    }
    #endif
    
    public func innerText(_ value: String) -> Self {
        self.innerText = value
        return self
    }
    
    public func innerText(_ value: UState<String>) -> Self {
        self.innerText = value.wrappedValue
        value.listen {
            self.innerText = $0
        }
        return self
    }
    
    public func innerText <V>(_ value: ExpressableState<V, String>) -> Self {
        innerText (value.unwrap())
    }
    
    public func innerHTML(_ value: String) -> Self {
        self.innerHTML = value
        return self
    }
    
    public func innerHTML(_ value: UState<String>) -> Self {
        self.innerHTML = value.wrappedValue
        value.listen {
            self.innerHTML = $0
        }
        return self
    }
    
    public func innerHTML<V>(_ value: ExpressableState<V, String>) -> Self {
        innerHTML(value.unwrap())
    }
}

extension _BaseContentElementable {
    func postBuildUI() {
        parseBodyBuilderItem(body.bodyBuilderContent)
    }
    
    func parseBodyBuilderItem(_ item: BodyBuilderItem) {
        switch item {
        case .elements(let elements):
            elements.forEach {
                guard let element = $0 as? _AnyElement else { return }
                subElements.append(element)
                #if !arch(wasm32)
                if previewMode == .dynamic {
                    appendChild(element)
                }
                #else
                appendChild(element)
                #endif
            }
        case .items(let items): items.forEach { parseBodyBuilderItem($0) }
        case .none: break
        }
    }
}
