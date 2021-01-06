//
//  BorderLeftStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the left border
///
/// ```html
/// border-left-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_style.asp)
public class BorderLeftStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderLeftStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderLeftStyle: PropertyKey<BorderStyleType> { "border-left-style".propertyKey() }
}
