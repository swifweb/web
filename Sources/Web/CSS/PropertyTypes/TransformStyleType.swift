//
//  TransformStyleType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TransformStyleType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies that child elements will NOT preserve its 3D position. This is default
    public static var flat: Self { .init("flat") }
    
    /// Specifies that child elements will preserve its 3D position
    public static var preserve3d: Self { .init("preserve-3d") }
    
    public var description: String { value }
}
