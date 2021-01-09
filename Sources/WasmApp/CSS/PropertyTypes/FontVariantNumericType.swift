//
//  FontVariantNumericType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol FontVariantNumericable: Valuable {
    static var ordinal: Self { get }
    static var slashedZero: Self { get }
    static var liningNums: Self { get }
    static var oldstyleNums: Self { get }
    static var proportionalNums: Self { get }
    static var tabularNums: Self { get }
    static var diagonalFractions: Self { get }
    static var stackedFractions: Self { get }
}

extension FontVariantNumericable {
    /// This keyword forces the use of special glyphs for the ordinal markers,
    /// like 1st, 2nd, 3rd, 4th in English or a 1a in Italian.
    /// It corresponds to the OpenType values `ordn`.
    public static var ordinal: Self { .init("ordinal") }
    
    /// This keyword forces the use of a 0 with a slash; this is useful
    /// when a clear distinction between O and 0 is needed.
    /// It corresponds to the OpenType values `zero`.
    public static var slashedZero: Self { .init("slashed-zero") }
    
    /// It is activating the set of figures where numbers are all lying on the baseline.
    /// It corresponds to the OpenType values `lnum`.
    public static var liningNums: Self { .init("lining-nums") }
    
    /// It is activating the set of figures where some numbers,
    /// like 3, 4, 7, 9 have descenders.
    /// It corresponds to the OpenType values `onum`.
    public static var oldstyleNums: Self { .init("oldstyle-nums") }
    
    /// It is activating the set of figures where numbers are not all of the same size.
    /// It corresponds to the OpenType values `pnum`.
    public static var proportionalNums: Self { .init("proportional-nums") }
    
    /// It is activating the set of figures where numbers are all of the same size,
    /// allowing them to be easily aligned like in tables.
    /// It corresponds to the OpenType values `tnum`.
    public static var tabularNums: Self { .init("tabular-nums") }
    
    /// It is activating the set of figures where the numerator
    /// and denominator are made smaller and separated by a slash.
    /// It corresponds to the OpenType values `frac`.
    public static var diagonalFractions: Self { .init("diagonal-fractions") }
    
    /// It is activating the set of figures where the numerator
    /// and denominator are made smaller, stacked and separated by a horizontal line.
    /// It corresponds to the OpenType values `afrc`.
    public static var stackedFractions: Self { .init("stacked-fractions") }
}

public struct FontVariantNumericType: Valuable, FontVariantNumericable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword leads to the deactivation of the use of such alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
