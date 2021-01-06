//
//  PaddingBottomProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the bottom padding of an element
///
/// ```html
/// padding-bottom: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_padding-bottom.asp)
public class PaddingBottomProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .paddingBottom }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var paddingBottom: PropertyKey<UnitValue> { "padding-bottom".propertyKey() }
}
