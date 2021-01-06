//
//  ColumnRuleColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
