//
//  ColumnRuleStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
