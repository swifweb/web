//
//  FontVariantPositionType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontVariantPositionType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Deactivates alternate superscript and subscript glyphs.
    public static var normal: Self { .init("normal") }
    
    /// Activates subscript alternate glyphs.
    /// If, in a given run, one such glyph is not available for a character,
    /// all the characters in the run are rendered using synthesized glyphs.
    public static var sub: Self { .init("sub") }
    
    /// Activates superscript alternate glyphs. If, in a given run,
    /// one such glyph is not available for a character, all the characters
    /// in the run are rendered using synthesized glyphs.
    public static var `super`: Self { .init("super") }
    
    public var description: String { value }
}
