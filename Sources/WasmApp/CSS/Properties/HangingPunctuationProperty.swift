//
//  HangingPunctuation.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies whether a punctuation character may be placed outside the line box
///
/// ```html
/// hanging-punctuation: first;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_hanging-punctuation.asp)
public class HangingPunctuationProperty: _Property {
    public var propertyKey: PropertyKey<HangingPunctuationType> { .hangingPunctuation }
    public var propertyValue: HangingPunctuationType
    var _content = _PropertyContent<HangingPunctuationType>()
    
    public init (_ type: HangingPunctuationType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var hangingPunctuation: PropertyKey<HangingPunctuationType> { "hanging-punctuation".propertyKey() }
}
