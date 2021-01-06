//
//  GridColumnGapProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the size of the gap between columns
///
/// ```html
/// grid-column-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-gap.asp)
public class GridColumnGapProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .gridColumnGap }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var gridColumnGap: PropertyKey<UnitValue> { "grid-column-gap".propertyKey() }
}
