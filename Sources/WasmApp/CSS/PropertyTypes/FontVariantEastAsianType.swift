//
//  FontVariantEastAsianType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol FontVariantEastAsianable: Valuable {
    static var ruby: Self { get }
    static var jis78: Self { get }
    static var jis83: Self { get }
    static var jis90: Self { get }
    static var jis04: Self { get }
    static var simplified: Self { get }
    static var traditional: Self { get }
}

extension FontVariantEastAsianable {
    /// This keyword forces the use of special glyphs for ruby characters.
    /// As these are usually smaller, font creators often designs specific forms,
    /// usually slightly bolder to improve the contrast.
    /// This keyword corresponds to the OpenType values `ruby`.
    public static var ruby: Self { .init("ruby") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp78`
    public static var jis78: Self { .init("jis78") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp83`
    public static var jis83: Self { .init("jis83") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp90`
    public static var jis90: Self { .init("jis90") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp04`
    public static var jis04: Self { .init("jis04") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `smpl`
    public static var simplified: Self { .init("simplified") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `trad`
    public static var traditional: Self { .init("traditional") }
}

public struct FontVariantEastAsianType: FontVariantEastAsianable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword leads to the deactivation of the use of such alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
