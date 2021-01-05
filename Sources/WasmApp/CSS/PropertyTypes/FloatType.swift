//
//  FloatType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct FloatType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element floats to the left of its container
    public static var left: Self { .init("left") }
    
    /// The element floats the right of its container
    public static var right: Self { .init("right") }
    
    public var description: String { value }
}
