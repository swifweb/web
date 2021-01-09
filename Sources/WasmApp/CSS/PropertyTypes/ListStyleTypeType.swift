//
//  ListStyleTypeType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct ListStyleTypeType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The marker is a filled circle
    public static var disc: Self { .init("disc") }
    
    /// The marker is traditional Armenian numbering
    public static var armenian: Self { .init("armenian") }
    
    /// The marker is a circle
    public static var circle: Self { .init("circle") }
    
    /// The marker is plain ideographic numbers
    public static var cjkIdeographic: Self { .init("cjk-ideographic") }
    
    /// The marker is a number
    public static var decimal: Self { .init("decimal") }
    
    /// The marker is a number with leading zeros (01, 02, 03, etc.)
    public static var decimalLeadingZero: Self { .init("decimal-leading-zero") }
    
    /// The marker is traditional Georgian numbering
    public static var georgian: Self { .init("georgian") }
    
    /// The marker is traditional Hebrew numbering
    public static var hebrew: Self { .init("hebrew") }
    
    /// The marker is traditional Hiragana numbering
    public static var hiragana: Self { .init("hiragana") }
    
    /// The marker is traditional Hiragana iroha numbering
    public static var hiraganaIroha: Self { .init("hiragana-iroha") }
    
    /// The marker is traditional Katakana numbering
    public static var katakana: Self { .init("katakana") }
    
    /// The marker is traditional Katakana iroha numbering
    public static var katakanaIroha: Self { .init("katakana-iroha") }
    
    /// The marker is lower-alpha (a, b, c, d, e, etc.)
    public static var lowerAlpha: Self { .init("lower-alpha") }
    
    /// The marker is lower-greek
    public static var lowerGreek: Self { .init("lower-greek") }
    
    /// The marker is lower-latin (a, b, c, d, e, etc.)
    public static var lowerLatin: Self { .init("lower-latin") }
    
    /// The marker is lower-roman (i, ii, iii, iv, v, etc.)
    public static var lowerRoman: Self { .init("lower-roman") }
    
    /// The marker is a square
    public static var square: Self { .init("square") }
    
    /// The marker is upper-alpha (A, B, C, D, E, etc.)
    public static var upperAlpha: Self { .init("upper-alpha") }
    
    /// The marker is upper-greek
    public static var upperGreek: Self { .init("upper-greek") }
    
    /// The marker is upper-latin (A, B, C, D, E, etc.)
    public static var upperLatin: Self { .init("upper-latin") }
    
    /// The marker is upper-roman (I, II, III, IV, V, etc.)
    public static var upperRoman: Self { .init("upper-roman") }
    
    public var description: String { value }
}
