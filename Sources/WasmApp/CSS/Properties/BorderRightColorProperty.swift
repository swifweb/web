//
//  BorderRightColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the color of the right border
///
/// ```html
/// border-right-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_color.asp)
public class BorderRightColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderRightColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderRightColor: PropertyKey<ColorType> { "border-right-color".propertyKey() }
}
