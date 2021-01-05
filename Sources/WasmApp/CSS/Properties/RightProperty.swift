//
//  Right.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the right position of a positioned element
///
/// ```html
/// div.absolute {
///     position: absolute;
///     right: 150px;
///     width: 200px;
///     height: 120px;
///     border: 3px solid green;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_right.asp)
public class RightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .right }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var right: PropertyKey<UnitValue> { "right".propertyKey() }
}
