//
//  BorderLeftColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the color of the left border
///
/// ```html
/// border-left-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_color.asp)
public class BorderLeftColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderLeftColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderLeftColor: PropertyKey<ColorType> { "border-left-color".propertyKey() }
}
