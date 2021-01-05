//
//  FontStyle.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the font style for text
///
/// ```html
/// font-style: normal;
/// font-style: italic;
/// font-style: oblique;
/// font-style: oblique 10deg;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style)
public class FontStyleProperty: _Property {
    public var propertyKey: PropertyKey<FontStyleType> { .fontStyle }
    public var propertyValue: FontStyleType
    var _content = _PropertyContent<FontStyleType>()
    
    public init (_ type: FontStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var fontStyle: PropertyKey<FontStyleType> { "font-style".propertyKey() }
}
