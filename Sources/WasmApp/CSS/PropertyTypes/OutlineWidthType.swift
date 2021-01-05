//
//  OutlineWidthType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct OutlineWidthType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a medium outline. This is default
    public static var medium: Self { .init("medium") }
    
    /// Specifies a thin outline
    public static var thin: Self { .init("thin") }
    
    /// Specifies a thick outline
    public static var thick: Self { .init("thick") }
    
    public var description: String { value }
}
