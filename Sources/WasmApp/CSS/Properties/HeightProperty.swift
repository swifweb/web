//
//  Height.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the height of an element
///
/// ```html
/// height: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_height.asp)
public class HeightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .height }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var height: PropertyKey<UnitValue> { "height".propertyKey() }
}

/// Sets the minimum height of an element
///
/// ```html
/// min-height: 200px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_min-height.asp)
public class MinHeightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .minHeight }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var minHeight: PropertyKey<UnitValue> { "min-height".propertyKey() }
}

/// Sets the maximum height of an element
///
/// ```html
/// max-height: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_max-height.asp)
public class MaxHeightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .maxHeight }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var maxHeight: PropertyKey<UnitValue> { "max-height".propertyKey() }
}
