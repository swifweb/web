//
//  TextDecorationLineType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextDecorationLineType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies that a line will be displayed under the text    Play it »
    public static var underline: Self { .init("underline") }
    
    /// Specifies that a line will be displayed over the text
    public static var overline: Self { .init("overline") }
    
    /// Specifies that a line will be displayed through the text
    public static var lineThrough: Self { .init("line-through") }
    
    public var description: String { value }
}
