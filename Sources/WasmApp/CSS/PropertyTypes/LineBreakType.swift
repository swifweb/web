//
//  LineBreakType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct LineBreakType: Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Break text using the least restrictive line break rule.
    /// Typically used for short lines, such as in newspapers.
    public static var loose: Self { .init("loose") }
    
    /// Break text using the most common line break rule.
    public static var normal: Self { .init("normal") }
    
    /// Break text using the most stringent line break rule.
    public static var strict: Self { .init("strict") }
    
    /// There is a soft wrap opportunity around every typographic character unit,
    /// including around any punctuation character or preserved white spaces,
    /// or in the middle of words, disregarding any prohibition against line breaks,
    /// even those introduced by characters with the GL, WJ, or ZWJ character class
    /// or mandated by the word-break property.
    /// The different wrapping opportunities must not be prioritized.
    /// Hyphenation is not applied.
    public static var anywhere: Self { .init("anywhere") }
    
    public var description: String { value }
}
