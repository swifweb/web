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
        parsePropertiesItem(content().propertiesContent)
    }
    
    public convenience init (_ pointers: Pointerable...) {
        self.init(pointers)
    }
    
    public convenience init (_ pointers: Pointerable..., @Properties content: @escaping Properties.Block) {
        self.init(pointers, content: content)
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
        case .property(let v):
            if let index = _properties.firstIndex(where: { $0.key == v.key }) {
                _properties.remove(at: index)
            }
            _properties.append(_Property(key: v.key, value: v.value))
        case .none: break
        }
    }
    
    var _pointers: [Pointerable] = []
    struct _Property {
        let key, value: String
    }
    var _properties: [_Property] = []
    
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
        set { domElement?.cssText = newValue.jsValue }
    }
    
    /// Represents selector for the rule
    var selectorText: String {
        get { domElement?.selectorText.string ?? "" }//selectorElements.joined(separator: ",") }
        set { domElement?.selectorText = newValue.jsValue }
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
        if let index = _properties.firstIndex(where: { $0.key == key }) {
            _properties.remove(at: index)
        }
        _properties.append(_Property(key: key, value: value))
        #if arch(wasm32)
        domElement?.style.object?.removeProperty.function?.callAsFunction(optionalThis: domElement?.style.object, key)
        if value.hasSuffix("!important"), let left = value.components(separatedBy: "!").first {
            domElement?.style.object?.setProperty.function?.callAsFunction(optionalThis: domElement?.style.object, key, left.jsValue, "important".jsValue)
        } else {
            domElement?.style.object?.setProperty.function?.callAsFunction(optionalThis: domElement?.style.object, key, value.jsValue)
        }
        #endif
    }
    
    func remove(_ key: String) {
        if let index = _properties.firstIndex(where: { $0.key == key }) {
            _properties.remove(at: index)
        }
        #if arch(wasm32)
        domElement?.style.object?[key] = JSValue.null
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
        func invokeResizeEvent() {
            if let s = self as? BaseElement, [
                PropertyType.left.description,
                PropertyType.right.description,
                PropertyType.top.description,
                PropertyType.bottom.description,
                PropertyType.margin.description,
                PropertyType.marginLeft.description,
                PropertyType.marginTop.description,
                PropertyType.marginRight.description,
                PropertyType.marginBottom.description,
                PropertyType.padding.description,
                PropertyType.paddingLeft.description,
                PropertyType.paddingTop.description,
                PropertyType.paddingRight.description,
                PropertyType.paddingBottom.description,
                PropertyType.visibility.description,
                PropertyType.display.description,
                PropertyType.border.description,
                PropertyType.borderTop.description,
                PropertyType.borderLeft.description,
                PropertyType.borderRight.description,
                PropertyType.borderBottom.description,
                PropertyType.borderWidth.description,
                PropertyType.borderTopWidth.description,
                PropertyType.borderLeftWidth.description,
                PropertyType.borderRightWidth.description,
                PropertyType.borderBottomWidth.description
            ].contains(property.key) {
                s.invokeResizeEvent()
            }
        }
        _setProperty(key, property.value, important: false)
        invokeResizeEvent()
        if let internalChangeable = property.propertyValue as? _PropertyValueInnerChangeable {
            internalChangeable._changeHandler = {
                self._setProperty(key, property.propertyValue.description, important: false)
                invokeResizeEvent()
            }
        }
        property._content._changeHandler = { newValue in
            guard let newValue = newValue else {
                self._removeProperty(key)
                invokeResizeEvent()
                return
            }
            self._setProperty(key, newValue.description, important: false)
            invokeResizeEvent()
        }
    }
    
    func _addProperty(_ key: String, _ value: String, important: Bool? = nil) {
        _setProperty(key, value, important: important)
    }

    func _addProperty<V>(_ key: PropertyKey<V>, _ value: V, important: Bool? = nil) where V : CustomStringConvertible {
        _addProperty(key.key, value.description, important: important)
    }

    func _addProperty<V>(_ key: PropertyKey<V>, value: String, important: Bool? = nil) where V : CustomStringConvertible {
        _addProperty(key.key, value, important: important)
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
        s.properties.styles.removeValue(forKey: key)
        #endif
    }

    func _setProperty(_ key: String, _ value: String, important: Bool?) {
        var value = value
        if important == true {
            value += (important == true ? "!important" : "")
        }
        #if arch(wasm32)
        if let s = self as? CSSRule {
            s.set(key, value)
        } else if let s = self as? DOMElement {
            if let existingStyleString = s.domElement[dynamicMember: "getAttribute"].function?.callAsFunction(optionalThis: s.domElement.object, arguments: ["style"]), !existingStyleString.isNull, var str = existingStyleString.string {
                str = str.split(separator: ";").filter({ !$0.hasPrefix("\(key):") }).joined(separator: ";")
                s.domElement[dynamicMember: "setAttribute"].function?.callAsFunction(optionalThis: s.domElement.object, arguments: ["style", "\(str);\(key):\(value);"])
            } else {
                s.domElement[dynamicMember: "setAttribute"].function?.callAsFunction(optionalThis: s.domElement.object, arguments: ["style", "\(key):\(value);"])
            }
        }
        #else
        if let s = self as? CSSRule {
            s.set(key, value)
        } else if let s = self as? DOMElement {
            s.properties.styles[key] = value
        }
        #endif
    }
}

extension BaseElement {
    func invokeResizeEvent() {
        func notifyListeners(_ element: DOMElement) {
            element.properties.subElements.forEach { (el: DOMElement) in
                el.properties.positionChangeListeners.forEach { $0() }
                notifyListeners(el)
            }
        }
        Dispatch.async { [weak self] in
            guard let self = self else { return }
            notifyListeners(self)
        }
    }
}
