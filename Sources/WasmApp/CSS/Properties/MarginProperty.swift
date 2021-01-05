//
//  Margin.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets all the margin properties in one declaration
///
/// ```html
/// margin: 35px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin.asp)
public class MarginProperty: _Property {
    public var propertyKey: PropertyKey<MarginValue> { .margin }
    public var propertyValue: MarginValue
    var _content = _PropertyContent<MarginValue>()
    
    public init (_ value: MarginValue) {
        propertyValue = value
    }
    
    public init (_ type: AutoType) {
        propertyValue = MarginValue(type)
    }
    
    public init<T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) {
        propertyValue = MarginValue(top: top, right: right, bottom: bottom, left: left)
    }
    
    public init<T: UnitValuable, X: UnitValuable, B: UnitValuable>(top: T, x: X, bottom: B) {
        propertyValue = MarginValue(top: top, x: x, bottom: bottom)
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        propertyValue = MarginValue(x: x, y: y)
    }
    
    public init<U: UnitValuable>(all: U) {
        propertyValue = MarginValue(all: all)
    }
}

extension PropertyKey {
    public static var margin: PropertyKey<MarginValue> { "margin".propertyKey() }
}

public struct MarginValue: CustomStringConvertible {
    let value: String
    
    public init (_ type: AutoType) {
        value = type.value
    }
    
    public init<T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) {
        value = [top.description, right.description, bottom.description, left.description].joined(separator: " ")
    }
    
    public init<T: UnitValuable, X: UnitValuable, B: UnitValuable>(top: T, x: X, bottom: B) {
        value = [top.description, x.description, bottom.description].joined(separator: " ")
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        value = [x.description, y.description].joined(separator: " ")
    }
    
    public init<U: UnitValuable>(all: U) {
        value = all.description
    }
    
    public var description: String { value }
}

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

/// Sets the left margin of an element
///
/// ```html
/// margin-left: 30px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-left.asp)
public class MarginLeftProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginLeft }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var marginLeft: PropertyKey<UnitValue> { "margin-left".propertyKey() }
}

/// Sets the right margin of an element
///
/// ```html
/// margin-right: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-right.asp)
public class MarginRightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginRight }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var marginRight: PropertyKey<UnitValue> { "margin-right".propertyKey() }
}

/// Sets the top margin of an element
///
/// ```html
/// margin-top: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-top.asp)
public class MarginTopProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginTop }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ type: U) {
        propertyValue = UnitValue(type.value.doubleValue, type.unit)
    }
}

extension PropertyKey {
    public static var marginTop: PropertyKey<UnitValue> { "margin-top".propertyKey() }
}
