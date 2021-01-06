//
//  BorderTopStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the top border
///
/// ```html
/// border-top-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_style.asp)
public class BorderTopStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderTopStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderTopStyle: PropertyKey<BorderStyleType> { "border-top-style".propertyKey() }
}
