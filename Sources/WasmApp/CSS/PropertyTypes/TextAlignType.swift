//
//  TextAlignType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextAlignType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
        
    /// Aligns the text to the left
    public static var left: Self { .init("left") }
        
    /// Aligns the text to the right
    public static var right: Self { .init("right") }
    
    /// Centers the text
    public static var center: Self { .init("center") }
            
    /// Stretches the lines so that each line has equal width (like in newspapers and magazines)
    public static var justify: Self { .init("justify") }
    
    public var description: String { value }
}
