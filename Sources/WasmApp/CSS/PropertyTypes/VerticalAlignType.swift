//
//  VerticalAlignType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct VerticalAlignType: Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element is aligned with the baseline of the parent. This is default
    public static var baseline: Self { .init("baseline") }
    
    /// The element is aligned with the subscript baseline of the parent
    public static var sub: Self { .init("sub") }
    
    /// The element is aligned with the superscript baseline of the parent
    public static var `super`: Self { .init("super") }
    
    /// The element is aligned with the top of the tallest element on the line
    public static var top: Self { .init("top") }
    
    /// The element is aligned with the top of the parent element's font
    public static var textTop: Self { .init("text-top") }
    
    /// The element is placed in the middle of the parent element
    public static var middle: Self { .init("middle") }
    
    /// The element is aligned with the lowest element on the line
    public static var bottom: Self { .init("bottom") }
    
    /// The element is aligned with the bottom of the parent element's font
    public static var textBottom: Self { .init("text-bottom") }
    
    public var description: String { value }
}
