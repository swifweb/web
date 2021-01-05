//
//  LetterSpacing.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Increases or decreases the space between characters in a text
///
/// ```html
/// letter-spacing: 3px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_letter-spacing.asp)
public class LetterSpacingProperty: _Property {
    public var propertyKey: PropertyKey<LetterSpacingType> { .letterSpacing }
    public var propertyValue: LetterSpacingType
    var _content = _PropertyContent<LetterSpacingType>()
    
    public init (_ type: LetterSpacingType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var letterSpacing: PropertyKey<LetterSpacingType> { "letter-spacing".propertyKey() }
}
