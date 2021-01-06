//
//  BorderRightWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the right border
///
/// ```html
/// border-right-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_width.asp)
public class BorderRightWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderRightWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderRightWidth: PropertyKey<BorderWidthType> { "border-right-width".propertyKey() }
}
