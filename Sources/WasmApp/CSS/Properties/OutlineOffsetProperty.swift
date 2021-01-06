//
//  OutlineOffsetProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Offsets an outline, and draws it beyond the border edge
///
/// ```html
/// outline-offset: 15px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_outline-offset.asp)
public class OutlineOffsetProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .outlineOffset }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var outlineOffset: PropertyKey<UnitValue> { "outline-offset".propertyKey() }
}
