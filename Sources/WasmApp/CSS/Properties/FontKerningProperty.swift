//
//  FontKerning.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of the kerning information (how letters are spaced)
///
/// ```html
/// font-kerning: auto;
/// font-kerning: normal;
/// font-kerning: none;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-kerning)
public class FontKerningProperty: _Property {
    public var propertyKey: PropertyKey<FontKerningType> { .fontKerning }
    public var propertyValue: FontKerningType
    var _content = _PropertyContent<FontKerningType>()
    
    public init (_ type: FontKerningType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var fontKerning: PropertyKey<FontKerningType> { "font-kerning".propertyKey() }
}
