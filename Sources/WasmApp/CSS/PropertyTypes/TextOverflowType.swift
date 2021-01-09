//
//  TextOverflowType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextOverflowType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The text is clipped and not accessible
    public static var clip: Self { .init("clip") }
    
    /// Render an ellipsis ("...") to represent the clipped text
    public static var ellipsis: Self { .init("ellipsis") }
    
    /// Render the given string to represent the clipped text
    public static func string(_ v: String) -> Self { .init("\"\(v)\"") }
    
    public var description: String { value }
}
