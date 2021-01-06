//
//  Padding.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// A shorthand property for all the padding-* properties
///
/// ```html
/// padding: 35px 12px 16px 35px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_padding.asp)
public class PaddingProperty: _Property {
    public var propertyKey: PropertyKey<PaddingValue> { .padding }
    public var propertyValue: PaddingValue
    var _content = _PropertyContent<PaddingValue>()
    
    public init (_ value: PaddingValue) {
        propertyValue = value
    }
    
    public init<T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) {
        propertyValue = PaddingValue(top: top, right: right, bottom: bottom, left: left)
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        propertyValue = PaddingValue(x: x, y: y)
    }
    
    public init<U: UnitValuable>(all: U) {
        propertyValue = PaddingValue(all: all)
    }
}

extension PropertyKey {
    public static var padding: PropertyKey<PaddingValue> { "padding".propertyKey() }
}

public struct PaddingValue: CustomStringConvertible {
    public let value: String
    
    public init<T: UnitValuable, R: UnitValuable, B: UnitValuable, L: UnitValuable>(top: T, right: R, bottom: B, left: L) {
        value = [top.description, right.description, bottom.description, left.description].joined(separator: " ")
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        value = [x.description, y.description].joined(separator: " ")
    }
    
    public init<U: UnitValuable>(all: U) {
        value = all.description
    }
    
    public var description: String { value }
}
