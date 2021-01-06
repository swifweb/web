//
//  MarginRightProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the right margin of an element
///
/// ```html
/// margin-right: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-right.asp)
public class MarginRightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginRight }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var marginRight: PropertyKey<UnitValue> { "margin-right".propertyKey() }
}
