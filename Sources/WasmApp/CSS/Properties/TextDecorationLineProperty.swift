//
//  TextDecorationLine.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the type of line in a text-decoration
///
/// ```html
/// div.a {
///     text-decoration-line: overline;
/// }
///
/// div.b {
///     text-decoration-line: underline;
/// }
///
/// div.c {
///     text-decoration-line: line-through;
/// }
///
/// div.d {
///     text-decoration-line: overline underline;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-decoration-line.asp)
public class TextDecorationLineProperty: _Property {
    public var propertyKey: PropertyKey<TextDecorationLineType> { .textDecorationLine }
    public var propertyValue: TextDecorationLineType
    var _content = _PropertyContent<TextDecorationLineType>()
    
    public init (_ type: TextDecorationLineType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textDecorationLine: PropertyKey<TextDecorationLineType> { "text-decoration-line".propertyKey() }
}
