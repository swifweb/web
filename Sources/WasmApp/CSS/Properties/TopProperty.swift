//
//  Top.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the top position of a positioned element
///
/// ```html
/// div {
///     position: absolute;
///     top: 50px;
///     border: 3px solid green;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_top.asp)
public class TopProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .top }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var top: PropertyKey<UnitValue> { "top".propertyKey() }
}
