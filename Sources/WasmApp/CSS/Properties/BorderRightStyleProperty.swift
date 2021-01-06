//
//  BorderRightStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the right border
///
/// ```html
/// border-right-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_style.asp)
public class BorderRightStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderRightStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderRightStyle: PropertyKey<BorderStyleType> { "border-right-style".propertyKey() }
}
