//
//  BorderColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the color of the four borders
///
/// ```html
/// border-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-color.asp)
public class BorderColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderColor: PropertyKey<ColorType> { "border-color".propertyKey() }
}
