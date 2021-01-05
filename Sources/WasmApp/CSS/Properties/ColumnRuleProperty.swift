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

/// Specifies the color of the rule between columns
///
/// ```html
/// column-rule-color: #ff0000;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-rule-color.asp)
public class ColumnRuleColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .columnRuleColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var columnRuleColor: PropertyKey<ColorType> { "column-rule-color".propertyKey() }
}

/// Specifies the style of the rule between columns
///
/// ```html
/// column-rule-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-rule-style.asp)
public class ColumnRuleStyleProperty: _Property {
    public var propertyKey: PropertyKey<ColumnRuleStyleType> { .columnRuleStyle }
    public var propertyValue: ColumnRuleStyleType
    var _content = _PropertyContent<ColumnRuleStyleType>()
    
    public init (_ type: ColumnRuleStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var columnRuleStyle: PropertyKey<ColumnRuleStyleType> { "column-rule-style".propertyKey() }
}

/// Specifies the width of the rule between columns
///
/// ```html
/// column-rule-width: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-rule-width.asp)
public class ColumnRuleWidthProperty: _Property {
    public var propertyKey: PropertyKey<ColumnRuleWidthType> { .columnRuleWidth }
    public var propertyValue: ColumnRuleWidthType
    var _content = _PropertyContent<ColumnRuleWidthType>()
    
    public init (_ type: ColumnRuleWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var columnRuleWidth: PropertyKey<ColumnRuleWidthType> { "column-rule-width".propertyKey() }
}
