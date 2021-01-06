//
//  BorderTopColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the color of the top border
///
/// ```html
/// border-top-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_color.asp)
public class BorderTopColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderTopColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderTopColor: PropertyKey<ColorType> { "border-top-color".propertyKey() }
}
