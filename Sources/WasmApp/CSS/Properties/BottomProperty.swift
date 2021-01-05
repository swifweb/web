//
//  Bottom.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Sets the elements position, from the bottom of its parent element
///
/// ```html
/// bottom: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_bottom.asp)
public class BottomProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .bottom }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var bottom: PropertyKey<UnitValue> { "bottom".propertyKey() }
}
