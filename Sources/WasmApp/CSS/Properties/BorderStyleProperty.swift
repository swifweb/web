//
//  BorderStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the four borders
///
/// ```html
/// border-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-style.asp)
public class BorderStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleValue> { .borderStyle }
    public var propertyValue: BorderStyleValue
    var _content = _PropertyContent<BorderStyleValue>()
    
    public init (_ value: BorderStyleValue) {
        propertyValue = value
    }
    
    public init (_ type: BorderStyleType...) {
        propertyValue = BorderStyleValue(type)
    }
    
    public init (_ type: [BorderStyleType]) {
        propertyValue = BorderStyleValue(type)
    }
}

extension PropertyKey {
    public static var borderStyle: PropertyKey<BorderStyleValue> { "border-style".propertyKey() }
}

public struct BorderStyleValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: BorderStyleType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [BorderStyleType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
