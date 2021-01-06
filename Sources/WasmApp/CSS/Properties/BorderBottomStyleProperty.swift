//
//  BorderBottomStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the bottom border
///
/// ```html
/// border-bottom-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_style.asp)
public class BorderBottomStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderBottomStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderBottomStyle: PropertyKey<BorderStyleType> { "border-bottom-style".propertyKey() }
}
