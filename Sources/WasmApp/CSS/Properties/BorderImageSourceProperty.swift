//
//  BorderImageSourceProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the path to the image to be used as a border
///
/// ```html
/// border-image-source: url(border.png);
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-source.asp)
public class BorderImageSourceProperty: _Property {
    public var propertyKey: PropertyKey<String> { .borderImageSource }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ src: String) {
        propertyValue = "url(\(src)"
    }
}

extension PropertyKey {
    public static var borderImageSource: PropertyKey<String> { "border-image-source".propertyKey() }
}
