//
//  TextOrientationType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextOrientationType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Rotates the characters of horizontal scripts 90° clockwise. Lays out the characters of vertical scripts naturally. Default value.
    public static var mixed: Self { .init("mixed") }
    
    /// Lays out the characters of horizontal scripts naturally (upright), as well as the glyphs for vertical scripts. Note that this keyword causes all characters to be considered as left-to-right: the used value of direction is forced to be ltr.
    public static var upright: Self { .init("upright") }
    
    /// Causes characters to be laid out as they would be horizontally, but with the whole line rotated 90° clockwise.
    public static var sideways: Self { .init("sideways") }
    
    /// An alias to sideways that is kept for compatibility purposes.
    public static var sidewaysRight: Self { .init("sideways-right") }
    
    /// On SVG elements, this keyword leads to use the value of the deprecated SVG properties glyph-orientation-vertical and glyph-orientation-horizontal.
    public static var useGlyphOrientation: Self { .init("use-glyph-orientation") }
    
    public var description: String { value }
}
