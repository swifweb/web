//
//  MarginLeftProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the left margin of an element
///
/// ```html
/// margin-left: 30px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-left.asp)
public class MarginLeftProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginLeft }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var marginLeft: PropertyKey<UnitValue> { "margin-left".propertyKey() }
}
