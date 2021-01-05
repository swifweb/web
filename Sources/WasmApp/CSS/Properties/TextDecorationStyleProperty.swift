//
//  TextDecorationStyle.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the style of the line in a text decoration
///
/// ```html
/// div.a {
///     text-decoration-line: underline;
///     text-decoration-style: solid;
/// }
///
/// div.b {
///     text-decoration-line: underline;
///     text-decoration-style: wavy;
/// }
///
/// div.c {
///     text-decoration-line: underline;
///     text-decoration-style: double;
/// }
///
/// div.d {
///     text-decoration-line: overline underline;
///     text-decoration-style: wavy;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-decoration-style.asp)
public class TextDecorationStyleProperty: _Property {
    public var propertyKey: PropertyKey<TextDecorationStyleType> { .textDecorationStyle }
    public var propertyValue: TextDecorationStyleType
    var _content = _PropertyContent<TextDecorationStyleType>()
    
    public init (_ type: TextDecorationStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textDecorationStyle: PropertyKey<TextDecorationStyleType> { "text-decoration-style".propertyKey() }
}
