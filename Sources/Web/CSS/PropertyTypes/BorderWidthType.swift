//
//  BorderWidthType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BorderWidthType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a medium border. This is default
    public static var medium: Self { .init("medium") }
    
    /// Specifies a thin border
    public static var thin: Self { .init("thin") }
    
    /// Specifies a thick border
    public static var thick: Self { .init("thick") }
    
    public var description: String { value }
}
