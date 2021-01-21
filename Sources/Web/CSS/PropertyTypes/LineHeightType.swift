//
//  LineHeightType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct LineHeightType: Initialable, Inheritable, Numberable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// A normal line height. This is default
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
