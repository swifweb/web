//
//  BorderImageWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the width of the border image
///
/// ```html
/// border-image-width: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-width.asp)
public class BorderImageWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderImageWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageWidth: PropertyKey<BorderWidthType> { "border-image-width".propertyKey() }
}
