//
//  ColumnWidth.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the column width
///
/// ```html
/// column-width: 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-width.asp)
public class ColumnWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .columnWidth }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var columnWidth: PropertyKey<UnitValue> { "column-width".propertyKey() }
}
