//
//  TextDecorationColor.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the color of the text-decoration
///
/// ```html
/// p {
///     text-decoration: underline;
///     text-decoration-color: red;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-decoration-color.asp)
public class TextDecorationColorProperty: _Property {
    public var propertyKey: PropertyKey<TextDecorationColorType> { .textDecorationColor }
    public var propertyValue: TextDecorationColorType
    var _content = _PropertyContent<TextDecorationColorType>()
    
    public init (_ type: TextDecorationColorType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textDecorationColor: PropertyKey<TextDecorationColorType> { "text-decoration-color".propertyKey() }
}
