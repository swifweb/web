//
//  CSSRule.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

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

open class CSSRule: RulesContent, _CSSRulable {
    public var rulesContent: Rules.Item { .rule(self) }
    
    private var _domElement: JSValue?
    var domElement: JSValue? {
        get { _domElement }
        set {
            guard let newValue = newValue, _domElement != nil else {
                _domElement = nil
                return
            }
            _domElement = newValue
        }
    }
    
    init (domElement: JSValue) {
        self.domElement = domElement
    }
    
    public init (_ pointers: [Pointerable]) {
        self.pointers = pointers
    }
    
    public convenience init (_ pointers: Pointerable...) {
        self.init(pointers)
    }
    
    var pointers: [Pointerable] = []
    var properties: [String: String] = [:]
    
//    public func property<V>(_ property: PropertyKey<V>, _ value: V) -> Self {
//        addRuleProperty(property.key, value.description)
//        return self
//    }
    
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
        properties[key] = value
        domElement?.style.object?[key] = value.jsValue()
    }
    
    func remove(_ key: String) {
        properties.removeValue(forKey: key)
        domElement?.style.object?[key] = JSValue.null
    }
    
    // MARK: _CSSRulable
    
    func _removeProperty(_ key: String) {
        remove(key)
    }
    
    func _setProperty(_ key: String, _ value: String) {
        set(key, value)
    }
}

public protocol CSSRulable: class {}

extension CSSRulable {
    var s: _CSSRulable? { self as? _CSSRulable }
}

protocol _CSSRulable: CSSRulable {
    func _removeProperty(_ key: String)
    func _setProperty(_ key: String, _ value: String)
    func _addProperty<P: _Property>(_ property: P)
    func _addProperty(_ key: String, _ value: String)
    func _addProperty<V>(_ key: PropertyKey<V>, _ value: V)
    func _addProperty<V>(_ key: PropertyKey<V>, _ value: String)
}

extension _CSSRulable {
    func _addProperty<P: _Property>(_ property: P) {
        let key = property.key
        _setProperty(key, property.value)
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

    func _addProperty<V>(_ key: PropertyKey<V>, _ value: String) where V : CustomStringConvertible {
        _addProperty(key.key, value)
    }
}
