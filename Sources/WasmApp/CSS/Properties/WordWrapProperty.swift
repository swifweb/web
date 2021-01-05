//
//  WordWrap.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Allows long, unbreakable words to be broken and wrap to the next line
///
/// ```html
/// div {
///    word-wrap: break-word;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_word-wrap.asp)
public class WordWrapProperty: _Property {
    public var propertyKey: PropertyKey<WordWrapType> { .wordWrap }
    public var propertyValue: WordWrapType
    var _content = _PropertyContent<WordWrapType>()
    
    public init (_ type: WordWrapType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var wordWrap: PropertyKey<WordWrapType> { "word-wrap".propertyKey() }
}
