//
//  MaxWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the maximum width of an element
///
/// ```html
/// max-width: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_max-width.asp)
public class MaxWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .maxWidth }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = .init(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var maxWidth: PropertyKey<UnitValue> { "max-width".propertyKey() }
}
