//
//  BorderWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the four borders
///
/// ```html
/// border-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-width.asp)
public class BorderWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthValue> { .borderWidth }
    public var propertyValue: BorderWidthValue
    var _content = _PropertyContent<BorderWidthValue>()
    
    public init (_ value: BorderWidthValue) {
        propertyValue = value
    }
    
    public init (_ type: BorderWidthType...) {
        propertyValue = BorderWidthValue(type)
    }
    
    public init (_ type: [BorderWidthType]) {
        propertyValue = BorderWidthValue(type)
    }
}

extension PropertyKey {
    public static var borderWidth: PropertyKey<BorderWidthValue> { "border-width".propertyKey() }
}

public struct BorderWidthValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: BorderWidthType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [BorderWidthType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
