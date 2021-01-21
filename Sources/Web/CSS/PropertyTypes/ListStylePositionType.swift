//
//  ListStylePositionType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct ListStylePositionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The bullet points will be inside the list item
    public static var inside: Self { .init("inside") }
    
    /// The bullet points will be outside the list item. This is default
    public static var outside: Self { .init("outside") }
    
    public var description: String { value }
}
