//
//  FontLanguageOverrideType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontLanguageOverrideType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Tells the browser to use font glyphs that are appropriate
    /// for the language specified by the lang attribute.
    /// This is the default value.
    public static var normal: Self { .init("normal") }
    
    /// Tells the browser to use font glyphs that are appropriate
    /// for the language specified by the string.
    /// The string must match a language tag found in the OpenType language system.
    /// For example, `ENG` is English, and `KOR` is Korean.
    public static func string(_ v: String) -> Self { .init("\"\(v)\"") }
    
    public var description: String { value }
}
