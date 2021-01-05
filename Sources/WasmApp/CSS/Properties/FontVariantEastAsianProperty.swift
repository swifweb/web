//
//  FontVariantEastAsian.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
///
/// ```html
/// font-variant-east-asian: normal;
/// font-variant-east-asian: ruby;
/// font-variant-east-asian: jis78;              /* <east-asian-variant-values> */
/// font-variant-east-asian: jis83;              /* <east-asian-variant-values> */
/// font-variant-east-asian: jis90;              /* <east-asian-variant-values> */
/// font-variant-east-asian: jis04;              /* <east-asian-variant-values> */
/// font-variant-east-asian: simplified;         /* <east-asian-variant-values> */
/// font-variant-east-asian: traditional;        /* <east-asian-variant-values> */
/// font-variant-east-asian: full-width;         /* <east-asian-width-values> */
/// font-variant-east-asian: proportional-width; /* <east-asian-width-values> */
/// font-variant-east-asian: ruby full-width jis83;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian)
public class FontVariantEastAsianProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantEastAsianValue> { .fontVariantEastAsian }
    public var propertyValue: FontVariantEastAsianValue
    var _content = _PropertyContent<FontVariantEastAsianValue>()
    
    public init (_ value: FontVariantEastAsianValue) {
        propertyValue = value
    }
    
    public init (_ type: FontVariantEastAsianType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [FontVariantEastAsianType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var fontVariantEastAsian: PropertyKey<FontVariantEastAsianValue> { "font-variant-east-asian".propertyKey() }
}

public struct FontVariantEastAsianValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontVariantEastAsianType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [FontVariantEastAsianType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
