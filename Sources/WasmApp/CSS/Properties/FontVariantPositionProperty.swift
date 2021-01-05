//
//  FontVariantPosition.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs of smaller size positioned as superscript or subscript regarding the baseline of the font
///
/// ```html
/// font-variant-position: normal;
/// font-variant-position: sub;
/// font-variant-position: super;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-position)
public class FontVariantPositionProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantPositionType> { .fontVariantPosition }
    public var propertyValue: FontVariantPositionType
    var _content = _PropertyContent<FontVariantPositionType>()
    
    public init (_ type: FontVariantPositionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var fontVariantPosition: PropertyKey<FontVariantPositionType> { "font-variant-position".propertyKey() }
}
