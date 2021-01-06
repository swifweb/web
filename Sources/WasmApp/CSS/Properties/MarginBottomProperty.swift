//
//  MarginBottomProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the bottom margin of an element
///
/// ```html
/// margin-bottom: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-bottom.asp)
public class MarginBottomProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginBottom }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var marginBottom: PropertyKey<UnitValue> { "margin-bottom".propertyKey() }
}
