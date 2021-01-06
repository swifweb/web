//
//  OutlineColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the color of an outline
///
/// ```html
/// outline-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-color.asp)
public class OutlineColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .outlineColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init(_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var outlineColor: PropertyKey<ColorType> { "outline-color".propertyKey() }
}
