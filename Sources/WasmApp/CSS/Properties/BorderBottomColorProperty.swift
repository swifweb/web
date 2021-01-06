//
//  BorderBottomColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the color of the bottom border
///
/// ```html
/// border-bottom-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_color.asp)
public class BorderBottomColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderBottomColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderBottomColor: PropertyKey<ColorType> { "border-bottom-color".propertyKey() }
}
