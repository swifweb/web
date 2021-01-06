//
//  MarginTopProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the top margin of an element
///
/// ```html
/// margin-top: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-top.asp)
public class MarginTopProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginTop }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var marginTop: PropertyKey<UnitValue> { "margin-top".propertyKey() }
}
