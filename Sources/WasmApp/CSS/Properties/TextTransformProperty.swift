//
//  TextTransform.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Controls the capitalization of text
///
/// ```html
/// div.a {
///     text-transform: uppercase;
/// }
///
/// div.b {
///     text-transform: lowercase;
/// }
///
/// div.c {
///     text-transform: capitalize;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-transform.asp)
public class TextTransformProperty: _Property {
    public var propertyKey: PropertyKey<TextTransformType> { .textTransform }
    public var propertyValue: TextTransformType
    var _content = _PropertyContent<TextTransformType>()
    
    public init (_ type: TextTransformType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textTransform: PropertyKey<TextTransformType> { "text-transform".propertyKey() }
}
