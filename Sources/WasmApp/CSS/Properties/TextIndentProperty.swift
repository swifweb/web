//
//  TextIndent.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the indentation of the first line in a text-block
///
/// ```html
/// div.a {
///     text-indent: 50px;
/// }
///
/// div.b {
///     text-indent: -2em;
/// }
///
/// div.c {
///     text-indent: 30%;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-indent.asp)
public class TextIndentProperty: _Property {
    public var propertyKey: PropertyKey<TextIndentType> { .textIndent }
    public var propertyValue: TextIndentType
    var _content = _PropertyContent<TextIndentType>()
    
    public init (_ type: TextIndentType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textIndent: PropertyKey<TextIndentType> { "text-indent".propertyKey() }
}
