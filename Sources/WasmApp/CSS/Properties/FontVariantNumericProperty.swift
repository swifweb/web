//
//  FontVariantNumeric.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
///
/// ```html
/// font-variant-numeric: normal;
/// font-variant-numeric: ordinal;
/// font-variant-numeric: slashed-zero;
/// font-variant-numeric: lining-nums;         /* <numeric-figure-values> */
/// font-variant-numeric: oldstyle-nums;       /* <numeric-figure-values> */
/// font-variant-numeric: proportional-nums;   /* <numeric-spacing-values> */
/// font-variant-numeric: tabular-nums;        /* <numeric-spacing-values> */
/// font-variant-numeric: diagonal-fractions;  /* <numeric-fraction-values> */
/// font-variant-numeric: stacked-fractions;   /* <numeric-fraction-values> */
/// font-variant-numeric: oldstyle-nums stacked-fractions;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric)
public class FontVariantNumericProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantNumericValue> { .fontVariantNumeric }
    public var propertyValue: FontVariantNumericValue
    var _content = _PropertyContent<FontVariantNumericValue>()
    
    public init (_ value: FontVariantNumericValue) {
        propertyValue = value
    }
    
    public init (_ type: FontVariantNumericType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [FontVariantNumericType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var fontVariantNumeric: PropertyKey<FontVariantNumericValue> { "font-variant-numeric".propertyKey() }
}

public struct FontVariantNumericValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontVariantNumericType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [FontVariantNumericType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
