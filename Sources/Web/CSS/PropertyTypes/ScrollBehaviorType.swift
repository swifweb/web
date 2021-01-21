//
//  ScrollBehaviorType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct ScrollBehaviorType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Allows a smooth animated "scroll effect" between elements within the scrolling box.
    public static var smooth: Self { .init("smooth") }
    
    public var description: String { value }
}
