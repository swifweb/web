//
//  TextTransformType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextTransformType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Transforms the first character of each word to uppercase
    public static var capitalize: Self { .init("capitalize") }
        
    /// Transforms all characters to uppercase
    public static var uppercase: Self { .init("uppercase") }
    
    /// Transforms all characters to lowercase
    public static var lowercase: Self { .init("lowercase") }
    
    public var description: String { value }
}
