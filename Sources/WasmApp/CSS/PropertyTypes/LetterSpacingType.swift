//
//  LetterSpacingType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct LetterSpacingType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// No extra space between characters. This is default
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
