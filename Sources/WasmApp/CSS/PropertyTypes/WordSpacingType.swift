//
//  WordSpacingType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct WordSpacingType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines normal space between words (0.25em) . This is default
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
