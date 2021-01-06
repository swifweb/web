//
//  ColumnRule.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for all the column-rule-* properties
///
/// ```html
/// column-rule: 4px double #ff00ff;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-rule.asp)
public class ColumnRuleProperty: _Property {
    public var propertyKey: PropertyKey<ColumnRuleValue> { .columnRule }
    public var propertyValue: ColumnRuleValue
    var _content = _PropertyContent<ColumnRuleValue>()
    
    public init (_ value: ColumnRuleValue) {
        propertyValue = value
    }
    
    public init (width: ColumnRuleWidthType, style: ColumnRuleStyleType, color: ColorType) {
        propertyValue = ColumnRuleValue(width: width, style: style, color: color)
    }
}

extension PropertyKey {
    public static var columnRule: PropertyKey<ColumnRuleValue> { "column-rule".propertyKey() }
}

public struct ColumnRuleValue: CustomStringConvertible {
    public let value: String
    
    public init (width: ColumnRuleWidthType, style: ColumnRuleStyleType, color: ColorType) {
        value = [width.value, style.value, color.description].joined(separator: " ")
    }
    
    public var description: String { value }
}
