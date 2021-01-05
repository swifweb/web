//
//  FontVariantLigatures.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
///
/// ```html
/// font-variant-ligatures: normal;
/// font-variant-ligatures: none;
/// font-variant-ligatures: common-ligatures;           /* <common-lig-values> */
/// font-variant-ligatures: no-common-ligatures;        /* <common-lig-values> */
/// font-variant-ligatures: discretionary-ligatures;    /* <discretionary-lig-values> */
/// font-variant-ligatures: no-discretionary-ligatures; /* <discretionary-lig-values> */
/// font-variant-ligatures: historical-ligatures;       /* <historical-lig-values> */
/// font-variant-ligatures: no-historical-ligatures;    /* <historical-lig-values> */
/// font-variant-ligatures: contextual;                 /* <contextual-alt-values> */
/// font-variant-ligatures: no-contextual;              /* <contextual-alt-values> */
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures)
public class FontVariantLigaturesProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantLigaturesValue> { .fontVariantLigatures }
    public var propertyValue: FontVariantLigaturesValue
    var _content = _PropertyContent<FontVariantLigaturesValue>()
    
    public init (_ value: FontVariantLigaturesValue) {
        propertyValue = value
    }
    
    public init (_ type: FontVariantLigaturesType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [FontVariantLigaturesType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var fontVariantLigatures: PropertyKey<FontVariantLigaturesValue> { "font-variant-ligatures".propertyKey() }
}

public struct FontVariantLigaturesValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontVariantLigaturesType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [FontVariantLigaturesType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
