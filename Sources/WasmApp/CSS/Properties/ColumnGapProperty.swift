//
//  ColumnGap.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the gap between the columns
///
/// ```html
/// column-gap: 40px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-gap.asp)
public class ColumnGapProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .columnGap }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var columnGap: PropertyKey<UnitValue> { "column-gap".propertyKey() }
}
