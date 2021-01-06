//
//  BackgroundColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the background color of an element
///
/// ```html
/// background-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-color.asp)
public class BackgroundColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .backgroundColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var backgroundColor: PropertyKey<ColorType> { "background-color".propertyKey() }
}
