//
//  FontFamilyType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontFamilyType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String

    public init (_ value: String) { self.value = value }
    
    /// The name of a font family. For example, "Times" and "Helvetica" are font families.
    /// Font family names containing whitespace should be quoted.
    public static func familyName(_ v: String) -> Self { .init(v) }
    
    /// Glyphs have finishing strokes, flared or tapering ends, or have actual serifed endings.
    /// E.g. Lucida Bright, Lucida Fax, Palatino, "Palatino Linotype", Palladio, "URW Palladio", serif.
    public static var serif: Self { .init("serif") }
    
    /// Glyphs have stroke endings that are plain.
    /// E.g. "Open Sans", "Fira Sans", "Lucida Sans", "Lucida Sans Unicode", "Trebuchet MS", "Liberation Sans", "Nimbus Sans L", sans-serif.
    public static var sansSerif: Self { .init("sans-serif") }
    
    /// All glyphs have the same fixed width.
    /// E.g. "Fira Mono", "DejaVu Sans Mono", Menlo, Consolas, "Liberation Mono", Monaco, "Lucida Console", monospace.
    public static var monospace: Self { .init("monospace") }
    
    /// Glyphs in cursive fonts generally have either joining strokes
    /// or other cursive characteristics beyond those of italic typefaces.
    /// The glyphs are partially or completely connected,
    /// and the result looks more like handwritten pen or brush
    /// writing than printed letterwork.
    /// E.g. "Brush Script MT", "Brush Script Std", "Lucida Calligraphy", "Lucida Handwriting", "Apple Chancery", cursive.
    public static var cursive: Self { .init("cursive") }
    
    /// Fantasy fonts are primarily decorative fonts that contain playful representations of characters.
    /// E.g. Papyrus, Herculanum, Party LET, Curlz MT, Harrington, fantasy.
    public static var fantasy: Self { .init("fantasy") }
    
    /// Glyphs are taken from the default user interface font on a given platform.
    /// Because typographic traditions vary widely across the world,
    /// this generic is provided for typefaces that don't map cleanly into the other generics.
    /// This is example system-ui text.
    public static var systemUI: Self { .init("system-ui") }
    
    /// The default user interface serif font.
    /// This is example ui-serif text.
    public static var uiSerif: Self { .init("ui-serif") }
    
    /// The default user interface sans-serif font.
    /// This is example ui-sans-serif text.
    public static var uiSansSerif: Self { .init("ui-sans-serif") }
    
    /// The default user interface monospace font.
    /// This is example ui-monospace text.
    public static var uiMonospace: Self { .init("ui-monospace") }
    
    /// The default user interface font that has rounded features.
    /// This is example ui-rounded text.
    public static var uiRounded: Self { .init("ui-rounded") }
    
    /// This is for the particular stylistic concerns of representing mathematics:
    /// superscript and subscript, brackets that cross several lines,
    /// nesting expressions, and double struck glyphs with distinct meanings.
    /// This is some example math text: ax² + bx + c = 0.
    public static var math: Self { .init("math") }
    
    /// Fonts that are specifically designed to render emoji.
    /// This is some example emoji text: ✝♾.
    public static var emoji: Self { .init("emoji") }
    
    /// A particular style of Chinese characters that are
    /// between serif-style Song and cursive-style Kai forms.
    /// This style is often used for government documents.
    /// This is some example fangsong text
    /// with the Chinese characters for "fangsong" in traditional
    /// and simple forms, respectively: 仿宋體 仿宋体.
    public static var fangsong: Self { .init("fangsong") }
    
    public var description: String { value }
}
