//
//  TextAlignLastType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextAlignLastType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The last line is aligned to the left
    public static var left: Self { .init("left") }
    
    /// The last line is aligned to the right
    public static var right: Self { .init("right") }
    
    /// The last line is center-aligned
    public static var center: Self { .init("center") }
    
    /// The last line is justified as the rest of the lines
    public static var justify: Self { .init("justify") }
    
    /// The last line is aligned at the beginning of the line
    /// (left if the text-direction is left-to-right, and right is the text-direction is right-to-left)
    public static var start: Self { .init("start") }
    
    /// The last line is aligned at the end of the line
    /// (right if the text-direction is left-to-right, and left is the text-direction is right-to-left)
    public static var end: Self { .init("end") }
    
    public var description: String { value }
}
