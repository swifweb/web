//
//  FontVariantCaps.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs for capital letters
///
/// ```html
/// font-variant-caps: normal;
/// font-variant-caps: small-caps;
/// font-variant-caps: all-small-caps;
/// font-variant-caps: petite-caps;
/// font-variant-caps: all-petite-caps;
/// font-variant-caps: unicase;
/// font-variant-caps: titling-caps;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps)
public class FontVariantCapsProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantCapsValue> { .fontVariantCaps }
    public var propertyValue: FontVariantCapsValue
    var _content = _PropertyContent<FontVariantCapsValue>()
    
    public init (_ value: FontVariantCapsValue) {
        propertyValue = value
    }
    
    public init (_ type: FontVariantCapsType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [FontVariantCapsType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var fontVariantCaps: PropertyKey<FontVariantCapsValue> { "font-variant-caps".propertyKey() }
}

public struct FontVariantCapsValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontVariantCapsType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [FontVariantCapsType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
