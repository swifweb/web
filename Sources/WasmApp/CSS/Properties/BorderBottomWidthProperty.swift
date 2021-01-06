//
//  BorderBottomWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the bottom border
///
/// ```html
/// border-bottom-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_width.asp)
public class BorderBottomWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderBottomWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderBottomWidth: PropertyKey<BorderWidthType> { "border-bottom-width".propertyKey() }
}
