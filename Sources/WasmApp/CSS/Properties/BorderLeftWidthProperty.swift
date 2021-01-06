//
//  BorderLeftWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the left border
///
/// ```html
/// border-left-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_width.asp)
public class BorderLeftWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderLeftWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderLeftWidth: PropertyKey<BorderWidthType> { "border-left-width".propertyKey() }
}
