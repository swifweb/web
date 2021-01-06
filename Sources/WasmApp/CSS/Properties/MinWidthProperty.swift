//
//  MinWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the minimum width of an element
///
/// ```html
/// min-width: 500px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_min-width.asp)
public class MinWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .minWidth }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = .init(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var minWidth: PropertyKey<UnitValue> { "min-width".propertyKey() }
}
