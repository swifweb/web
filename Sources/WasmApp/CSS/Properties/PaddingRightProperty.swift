//
//  PaddingRightProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the right padding of an element
///
/// ```html
/// padding-right: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_padding-right.asp)
public class PaddingRightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .paddingRight }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var paddingRight: PropertyKey<UnitValue> { "padding-right".propertyKey() }
}
