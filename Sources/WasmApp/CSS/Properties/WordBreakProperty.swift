//
//  WordBreak.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how words should break when reaching the end of a line
///
/// ```html
/// p.a {
///    word-break: break-all;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_word-break.asp)
public class WordBreakProperty: _Property {
    public var propertyKey: PropertyKey<WordBreakType> { .wordBreak }
    public var propertyValue: WordBreakType
    var _content = _PropertyContent<WordBreakType>()
    
    public init (_ type: WordBreakType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var wordBreak: PropertyKey<WordBreakType> { "word-break".propertyKey() }
}
