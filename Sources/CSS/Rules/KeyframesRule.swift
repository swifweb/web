//
//  KeyframesRule.swift
//  CSS
//
//  Created by Mihael Isaev on 11.07.2020.
//

import Foundation
import JavaScriptKit

/// Describes the aspect of intermediate steps in a CSS animation sequence.
/// Specifies the animation code
///
/// ```html
///  @keyframes mymove {
///     from {top: 0px;}
///     50% {top: 80px;}
///     to {top: 200px;}
/// }
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes)
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-keyframes.asp)
public class Keyframes: RulesContent, CSSRulable, ExpressibleByStringLiteral {
    public var rulesContent: Rules.Item { .keyframes(self) }
    
    public internal(set) var domElement: JSValue?
    
    let propertyKey = "@keyframes"
    let name: String
    var values: [String: [String: String]] = [:]
    
    public init (_ name: KeyframesName) {
        self.name = name.value
    }
    
    public required init(stringLiteral value: StringLiteralType) {
        name = value
    }
    
    @discardableResult
    public func from(@Properties content: @escaping Properties.Block) -> Self {
        parsePropertiesItem(to: "from", content().propertiesContent)
        return self
    }
    
    @discardableResult
    public func to(@Properties content: @escaping Properties.Block) -> Self {
        parsePropertiesItem(to: "to", content().propertiesContent)
        return self
    }
    
    @discardableResult
    public func point(_ percentage: Int, @Properties content: @escaping Properties.Block) -> Self {
        parsePropertiesItem(to: "\(percentage)%", content().propertiesContent)
        return self
    }
    
    private func parsePropertiesItem(to key: String, _ item: Properties.Item) {
        switch item {
        case .items(let v): v.forEach { parsePropertiesItem(to: key, $0) }
        case .property(let v):
            if var value = values[key] {
                value[v.key] = v.value
                values[key] = value
            } else {
                values[key] = [v.key: v.value]
            }
        case .none: break
        }
    }
    
    public func render() -> String {
        var result = ""
        result.append(propertyKey + " " + name)
        result.append("{")
        values.forEach { kfv in
            result.append(kfv.key)
            result.append("{")
            result.append(kfv.value.map { $0.key + ":" + $0.value }.joined(separator: ";"))
            result.append("}")
        }
        result.append("}")
        return result
    }
}

public class KeyframesName: ExpressibleByStringLiteral {
    let value: String
    
    public required init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}
