//
//  BorderSpacingProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the distance between the borders of adjacent cells
///
/// ```html
/// border-spacing: 15px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-spacing.asp)
public class BorderSpacingProperty: _Property {
    public var propertyKey: PropertyKey<BorderSpacingValue> { .borderSpacing }
    public var propertyValue: BorderSpacingValue
    var _content = _PropertyContent<BorderSpacingValue>()
    
    public init (_ value: BorderSpacingValue) {
        propertyValue = value
    }
    
    public init<U: UnitValuable>(all: U) {
        propertyValue = BorderSpacingValue(all: all)
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V) {
        propertyValue = BorderSpacingValue(h: h, v: v)
    }
}

extension PropertyKey {
    public static var borderSpacing: PropertyKey<BorderSpacingValue> { "border-spacing".propertyKey() }
}

public struct BorderSpacingValue: CustomStringConvertible {
    public let value: String
    
    public init<U: UnitValuable>(all: U) {
        value = all.description
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V) {
        value = [h.description, v.description].joined(separator: " ")
    }
    
    public var description: String { value }
}
