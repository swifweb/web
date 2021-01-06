//
//  FlexBasisProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the initial length of a flexible item
///
/// ```html
/// flex-basis: 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-basis.asp)
public class FlexBasisProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .flexBasis }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var flexBasis: PropertyKey<UnitValue> { "flex-basis".propertyKey() }
}
