//
//  FontVariantAlternates.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
///
/// ```html
/// /* Keyword values */
/// font-variant-alternates: normal;
/// font-variant-alternates: historical-forms;
///
/// /* Functional notation values */
/// font-variant-alternates: stylistic(user-defined-ident);
/// font-variant-alternates: styleset(user-defined-ident);
/// font-variant-alternates: character-variant(user-defined-ident);
/// font-variant-alternates: swash(user-defined-ident);
/// font-variant-alternates: ornaments(user-defined-ident);
/// font-variant-alternates: annotation(user-defined-ident);
/// font-variant-alternates: swash(ident1) annotation(ident2);
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-alternates)
public class FontVariantAlternatesProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantAlternatesValue> { .fontVariantAlternates }
    public var propertyValue: FontVariantAlternatesValue
    var _content = _PropertyContent<FontVariantAlternatesValue>()
    
    public init (_ value: FontVariantAlternatesValue) {
        propertyValue = value
    }
    
    public init (_ type: FontVariantAlternatesType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [FontVariantAlternatesType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var fontVariantAlternates: PropertyKey<FontVariantAlternatesValue> { "font-variant-alternates".propertyKey() }
}

public struct FontVariantAlternatesValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontVariantAlternatesType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [FontVariantAlternatesType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
