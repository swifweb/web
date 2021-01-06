//
//  PaddingLeftProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the left padding of an element
///
/// ```html
/// padding-left: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_padding-left.asp)
public class PaddingLeftProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .paddingLeft }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var paddingLeft: PropertyKey<UnitValue> { "padding-left".propertyKey() }
}
