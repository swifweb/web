//
//  WordSpacing.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Increases or decreases the space between words in a text
///
/// ```html
/// p {
///    word-spacing: 30px;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_word-spacing.asp)
public class WordSpacingProperty: _Property {
    public var propertyKey: PropertyKey<WordSpacingType> { .wordSpacing }
    public var propertyValue: WordSpacingType
    var _content = _PropertyContent<WordSpacingType>()
    
    public init (_ type: WordSpacingType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var wordSpacing: PropertyKey<WordSpacingType> { "word-spacing".propertyKey() }
}
