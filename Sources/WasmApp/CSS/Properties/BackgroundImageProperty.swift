//
//  BackgroundImageProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies one or more background images for an element
///
/// ```html
/// background-image: url("paper.gif");
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-image.asp)
public class BackgroundImageProperty: _Property {
    public var propertyKey: PropertyKey<String> { .backgroundImage }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ src: String) {
        propertyValue = "url(\(src)"
    }
}

extension PropertyKey {
    public static var backgroundImage: PropertyKey<String> { "background-image".propertyKey() }
}
