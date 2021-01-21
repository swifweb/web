//
//  FontWeightType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontWeightType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines normal characters. This is default
    public static var normal: Self { .init("normal") }
        
    /// Defines thick characters
    public static var bold: Self { .init("bold") }
        
    /// Defines thicker characters
    public static var bolder: Self { .init("bolder") }
    
    /// Defines lighter characters
    public static var lighter: Self { .init("lighter") }
    
    public var description: String { value }
}
