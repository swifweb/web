//
//  OverflowType.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

public struct OverflowType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The content is not clipped, and it may be rendered outside the left and right edges. This is default
    public static var visible: Self { .init("visible") }
    
    /// The content is clipped - and no scrolling mechanism is provided
    public static var hidden: Self { .init("hidden") }
    
    /// The content is clipped and a scrolling mechanism is provided
    public static var scroll: Self { .init("scroll") }
    
    public var description: String { value }
}
