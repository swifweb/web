//
//  JustifyContentType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct JustifyContentType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Items are positioned at the beginning of the container
    public static var flexStart: Self { .init("flex-start") }
    
    /// Items are positioned at the end of the container
    public static var flexEnd: Self { .init("flex-end") }
    
    /// Items are positioned at the center of the container
    public static var center: Self { .init("center") }
    
    /// Items are positioned with space between the lines
    public static var spaceBetween: Self { .init("space-between") }
    
    /// Items are positioned with space before, between, and after the lines
    public static var spaceAround: Self { .init("space-around") }
    
    public var description: String { value }
}
