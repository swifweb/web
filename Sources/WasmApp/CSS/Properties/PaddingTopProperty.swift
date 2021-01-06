//
//  PaddingTopProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the top padding of an element
///
/// ```html
/// padding-top: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_padding-top.asp)
public class PaddingTopProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .paddingTop }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var paddingTop: PropertyKey<UnitValue> { "padding-top".propertyKey() }
}
