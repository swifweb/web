//
//  ColumnRuleWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
