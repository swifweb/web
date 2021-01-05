//
//  Left.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the left position of a positioned element
///
/// ```html
/// left: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_left.asp)
public class LeftProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .left }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var left: PropertyKey<UnitValue> { "left".propertyKey() }
}
