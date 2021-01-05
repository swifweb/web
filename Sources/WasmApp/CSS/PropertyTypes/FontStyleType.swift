//
//  FontStyleType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontStyleType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Selects a font that is classified as normal within a font-family.
    public static var normal: Self { .init("normal") }
    
    /// Selects a font that is classified as italic.
    /// If no italic version of the face is available, one classified as oblique is used instead.
    /// If neither is available, the style is artificially simulated.
    public static var italic: Self { .init("italic") }
    
    /// Selects a font that is classified as oblique.
    /// If no oblique version of the face is available, one classified as italic is used instead.
    /// If neither is available, the style is artificially simulated.
    public static var oblique: Self { .init("oblique") }
    
    /// Selects a font classified as oblique, and additionally specifies an angle
    /// for the slant of the text. If one or more oblique faces are available in the chosen font family,
    /// the one that most closely matches the specified angle is chosen.
    /// If no oblique faces are available, the browser will synthesize an oblique version
    /// of the font by slanting a normal face by the specified amount.
    /// Valid values are degree values of -90deg to 90deg inclusive.
    /// If an angle is not specified, an angle of 14 degrees is used.
    /// Positive values are slanted to the end of the line,
    /// while negative values are slanted towards the beginning.
    ///
    /// In general, for a requested angle of 14 degrees or greater,
    /// larger angles are prefered; otherwise, smaller angles are preferred
    /// (see the spec's font matching section for the precise algorithm).
    public static func oblique(_ angle: AngleValue) -> Self { .init("oblique " + angle.angleValue) }
    
    public var description: String { value }
}
