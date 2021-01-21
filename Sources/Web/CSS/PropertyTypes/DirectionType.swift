//
//  DirectionType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct DirectionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Text direction goes from left-to-right. This is default
    public static var ltr: Self { .init("ltr") }
    
    /// Text direction goes from right-to-left
    public static var rtl: Self { .init("rtl") }
    
    public var description: String { value }
}
