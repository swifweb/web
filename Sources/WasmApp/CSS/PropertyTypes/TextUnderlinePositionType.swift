//
//  TextUnderlinePositionType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextUnderlinePositionType: Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// If the font file includes information about a preferred position, use that value.
    /// If the font file doesn't include this information,
    /// behave as if auto was set, with the browser choosing an appropriate position.
    public static var fromFont: Self { .init("from-font") }
    
    /// Forces the line to be set below the alphabetic baseline,
    /// at a position where it won't cross any descenders.
    /// This is useful for ensuring legibility with chemical
    /// and mathematical formulas, which make a large use of subscripts.
    public static var under: Self { .init("under") }
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the left side of the text.
    /// In horizontal writing-modes, it is a synonym of under.
    public static var left: Self { .init("left") }
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the right side of the text.
    /// In horizontal writing-modes, it is a synonym of under.
    public static var right: Self { .init("right") }
    
    /// A synonym of auto, which should be used instead.
    public static var autoPos: Self { .init("auto-pos") }
    
    /// Forces the line to be above the text.
    /// When used with East-Asian text, using the auto keyword will lead to a similar effect.
    public static var above: Self { .init("above") }
    
    /// Forces the line to be below the text.
    /// When used with alphabetic text, using the auto keyword will lead to a similar effect.
    public static var below: Self { .init("below") }
    
    public var description: String { value }
}
