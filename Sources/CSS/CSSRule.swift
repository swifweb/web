//
//  CSSRule.swift
//  CSS
//
//  Created by Mihael Isaev on 29.11.2020.
//

import DOM

enum CSSRuleType: Int {
    case unknown = 0
    /// The most common kind of rule `selector { prop1: val1; }`
    case style = 1
    /// Removed in most browsers
    case charset = 2
    /// An @import rule.
    case `import` = 3
    case media = 4
    case fontFace = 5
    case page = 6
    case keyFrames = 7
    case keyFrame = 8
    /// future rule
    case colorProfile = 9
    case namespace = 10
    case counterStyle = 11
    case supports = 12
    case document = 13
    case fontFeatureValues = 14
    case viewport = 15
    case region = 16
}

open class CSSRule: RulesContent, CSSRulable {
    public var rulesContent: Rules.Item { .rule(self) }
    
    public internal(set) var domElement: JSValue?

    init (domElement: JSValue) {
        self.domElement = domElement
    }
    
    public init (_ pointers: [Pointerable]) {
        self._pointers = pointers
    }
    
    public init (_ pointers: [Pointerable], @Properties content: @escaping Properties.Block) {
        self._pointers = pointers
    }
    
    public convenience init (_ pointers: Pointerable...) {
        self.init(pointers)
    }
    
    public convenience init (_ pointers: Pointerable..., @Properties content: @escaping Properties.Block) {
        self.init(pointers)
    }
    
    @discardableResult
    public func properties(@Properties content: @escaping Properties.Block) -> Self {
        parsePropertiesItem(content().propertiesContent)
        return self
    }
    
    public typealias Content = Properties.Content
    @Properties open var properties: Content { _PropertiesContent(propertiesContent: .none) }
    
    private func parsePropertiesItem(_ item: Properties.Item) {
        switch item {
        case .items(let v): v.forEach { parsePropertiesItem($0) }
        case .property(let v): _properties[v.key] = v.value
        case .none: break
        }
    }
    
    var _pointers: [Pointerable] = []
    var _properties: [String: String] = [:]
    
    /// Alternative way to set properties of the rule
    public func property<V>(_ property: PropertyKey<V>, _ value: V) -> Self { // TODO: need autocomplete for rhs value
        _addProperty(property.key, value.description)
        return self
    }
    
    /// Represents the textual representation of the rule,
    /// e.g. "h1,h2 { font-size: 16pt }" or "@import 'url'".
    /// To access or modify parts of the rule (e.g. the value of "font-size" in the example)
    /// use the properties on the specialized interface for the rule's type.
    var cssText: String {
        get { domElement?.cssText.string ?? "" }//selectorText + "{ " + style.map { "\($0.key): \($0.value)" }.joined(separator: "; ") + "}" }
        set { domElement?.cssText = newValue.jsValue() }
    }
    
    /// Represents selector for the rule
    var selectorText: String {
        get { domElement?.selectorText.string ?? "" }//selectorElements.joined(separator: ",") }
        set { domElement?.selectorText = newValue.jsValue() }
    }
    
    /// Returns the containing rule, otherwise null.
    /// E.g. if this rule is a style rule inside an @media block,
    /// the parent rule would be that CSSMediaRule.
    var parentRule: JSValue? { domElement?.parentRule } // TODO: change type
    
//    /// Returns the CSSStyleSheet object for the style sheet that contains this rule
//    var parentStyleSheet: String { "" } // TODO: change type
    
    /// One of the Type constants indicating the type of CSS rule.
    var type: CSSRuleType {
        guard let number = domElement?.type.number else { return .unknown }
        return CSSRuleType(rawValue: Int(number)) ?? .unknown
    }
    
    func set(_ key: String, _ value: String) {
        _properties[key] = value
        #if arch(wasm32)
        domElement?.style.object?[key] = value.jsValue()
        #else // not supported, might be removed
//        previewLiveView.executeJS("""
//        document.getElementById('\(DOMProperties.in(self)._id)').style.\(key) = '\(value)';
//        """)
        #endif
    }
    
    func remove(_ key: String) {
        _properties.removeValue(forKey: key)
        #if arch(wasm32)
        domElement?.style.object?[key] = JSValue.null
        #else // not supported, might be removed
//        previewLiveView.executeJS("""
//        document.getElementById('\(DOMProperties.in(self)._id)').style.\(key) = null;
//        """)
        #endif
    }
    
    public func render() -> String {
        var result = _pointers.map { $0.pointer.selector }.joined(separator: ",")
        result.append("{")
        result.append(_properties.map { $0.key + ":" + $0.value }.joined(separator: ";"))
        result.append("}")
        return result
    }
}

public protocol CSSRulable {}

extension BaseElement: CSSRulable {}

extension CSSRulable {
    func _addProperty<P: _Property>(_ property: P) {
        let key = property.key
        _setProperty(key, property.value)
        if let internalChangeable = property.propertyValue as? _PropertyValueInnerChangeable {
            internalChangeable._changeHandler = {
                self._setProperty(key, property.propertyValue.description)
            }
        }
        property._content._changeHandler = { newValue in
            guard let newValue = newValue else {
                self._removeProperty(key)
                return
            }
            self._setProperty(key, newValue.description)
        }
    }
    
    func _addProperty(_ key: String, _ value: String) {
        _setProperty(key, value)
    }

    func _addProperty<V>(_ key: PropertyKey<V>, _ value: V) where V : CustomStringConvertible {
        _addProperty(key.key, value.description)
    }

    func _addProperty<V>(_ key: PropertyKey<V>, value: String) where V : CustomStringConvertible {
        _addProperty(key.key, value)
    }
    
    func _removeProperty(_ key: String) {
        #if arch(wasm32)
        if let s = self as? CSSRule {
            s.remove(key)
        } else if let s = self as? DOMElement {
            s.domElement.style.object?[key] = .null
        }
        #else
        guard let s = self as? DOMElement else { return }
        switch GlobalContext[PreviewMode.self] {
        case .static:
            s.properties.styles.removeValue(forKey: key)
        case .dynamic:
            GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
            document.getElementById('\(s.properties._id)').style.\(key) = null;
            """)
        case .none: break
        }
        #endif
    }

    func _setProperty(_ key: String, _ value: String) {
        #if arch(wasm32)
        if let s = self as? CSSRule {
            s.set(key, value)
        } else if let s = self as? DOMElement {
            s.domElement.style.object?[key] = value.jsValue()
        }
        #else
        guard let s = self as? DOMElement else { return }
        switch GlobalContext[PreviewMode.self] {
        case .static:
            s.properties.styles[key] = value
        case .dynamic:
            GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
            document.getElementById('\(s.properties._id)').style.\(key) = '\(value)';
            """)
        case .none: break
        }
        #endif
    }
}
