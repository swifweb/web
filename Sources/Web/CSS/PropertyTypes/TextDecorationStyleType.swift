//
//  TextDecorationStyleType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextDecorationStyleType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The line will display as a single line
    public static var solid: Self { .init("solid") }
    
    /// The line will display as a double line
    public static var double: Self { .init("double") }
    
    /// The line will display as a dotted line
    public static var dotted: Self { .init("dotted") }
    
    /// The line will display as a dashed line
    public static var dashed: Self { .init("dashed") }
    
    /// The line will display as a wavy line
    public static var wavy: Self { .init("wavy") }
    
    public var description: String { value }
}
