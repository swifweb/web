//
//  BorderTopWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the top border
///
/// ```html
/// border-top-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_width.asp)
public class BorderTopWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderTopWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderTopWidth: PropertyKey<BorderWidthType> { "border-top-width".propertyKey() }
}
