//
//  FontVariantAlternatesType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol FontVariantAlternatable: Valuable {
    static var historicalForms: Self { get }
    static func stylistic(_ fontNameNumber: Int) -> Self
    static func styleset(_ fontNameNumber: Int) -> Self
    static func characterVariant(_ fontNameNumber: Int) -> Self
    static func swash(_ fontNameNumber: Int) -> Self
    static func ornaments(_ fontNameNumber: Int) -> Self
    static func annotation(_ fontNameNumber: Int) -> Self
}

extension FontVariantAlternatable {
    /// This keyword enables historical forms — glyphs that were common in the past but not today.
    /// It corresponds to the OpenType value `hist`.
    public static var historicalForms: Self { .init("historical-forms") }
    
    /// This function enables stylistic alternates for individual characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `salt`, like `salt 2`.
    public static func stylistic(_ fontNameNumber: Int) -> Self { .init("stylistic(\(fontNameNumber))") }
    
    /// This function enables stylistic alternatives for sets of characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `ssXY`, like `ss02`.
    public static func styleset(_ fontNameNumber: Int) -> Self { .init("styleset(\(fontNameNumber))") }
    
    /// This function enables specific stylistic alternatives for characters.
    /// It is similar to styleset(), but doesn't create coherent glyphs for a set of characters;
    /// individual characters will have independent and not necessarily coherent styles.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `cvXY`, like `cv02`.
    public static func characterVariant(_ fontNameNumber: Int) -> Self { .init("character-variant(\(fontNameNumber))") }
    
    /// This function enables [swash](http://en.wikipedia.org/wiki/Swash_%28typography%29) glyphs.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType values `swsh` and `cswh`, like `swsh 2` and `cswh 2`.
    public static func swash(_ fontNameNumber: Int) -> Self { .init("swash(\(fontNameNumber))") }
    
    /// This function enables ornaments, like fleurons and other dingbat glyphs.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `ornm`, like `ornm 2`.
    public static func ornaments(_ fontNameNumber: Int) -> Self { .init("ornaments(\(fontNameNumber))") }
    
    /// This function enables annotations, like circled digits or inverted characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `nalt`, like `nalt 2`.
    public static func annotation(_ fontNameNumber: Int) -> Self { .init("annotation(\(fontNameNumber))") }
}

public struct FontVariantAlternatesType: FontVariantAlternatable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword deactivates alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
