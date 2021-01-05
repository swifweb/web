//
//  Width.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the width of an element
///
/// ```html
/// div.a {
///     width: auto;
///     border: 1px solid black;
/// }
///
/// div.b {
///     width: 150px;
///     border: 1px solid black;
/// }
///
/// div.c {
///     width: 50%;
///     border: 1px solid black;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_width.asp)
public class WidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .width }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = .init(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var width: PropertyKey<UnitValue> { "width".propertyKey() }
}

/// Sets the minimum width of an element
///
/// ```html
/// min-width: 500px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_min-width.asp)
public class MinWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .minWidth }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = .init(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var minWidth: PropertyKey<UnitValue> { "min-width".propertyKey() }
}

/// Sets the maximum width of an element
///
/// ```html
/// max-width: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_max-width.asp)
public class MaxWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .maxWidth }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = .init(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var maxWidth: PropertyKey<UnitValue> { "max-width".propertyKey() }
}
