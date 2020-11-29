//
//  CSSRule.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

enum CSSRuletype: Int {
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

class CSSRule {
    var domElement: JSValue
    
    init (domElement: JSValue) {
        self.domElement = domElement
    }
    
    /// Represents the textual representation of the rule,
    /// e.g. "h1,h2 { font-size: 16pt }" or "@import 'url'".
    /// To access or modify parts of the rule (e.g. the value of "font-size" in the example)
    /// use the properties on the specialized interface for the rule's type.
    var cssText: String {
        get { domElement.cssText.string ?? "" }
        set { domElement.cssText = newValue.jsValue() }
    }
    
    /// Represents selector for the rule
    var selectorText: String {
        get { domElement.selectorText.string ?? "" }
        set { domElement.selectorText = newValue.jsValue() }
    }
    
    /// Returns the containing rule, otherwise null.
    /// E.g. if this rule is a style rule inside an @media block,
    /// the parent rule would be that CSSMediaRule.
    var parentRule: JSValue? { domElement.parentRule } // TODO: change type
    
//    /// Returns the CSSStyleSheet object for the style sheet that contains this rule
//    var parentStyleSheet: String { "" } // TODO: change type
    
    /// One of the Type constants indicating the type of CSS rule.
    var type: CSSRuletype {
        guard let number = domElement.type.number else { return .unknown }
        return CSSRuletype(rawValue: Int(number)) ?? .unknown
    }
    
    func set(_ key: String, _ value: String) { // TODO: change type
        domElement.style.object?[key] = value.jsValue()
    }
    
    func remove(_ key: String) {
        domElement.style.object?[key] = JSValue.null
    }
}
