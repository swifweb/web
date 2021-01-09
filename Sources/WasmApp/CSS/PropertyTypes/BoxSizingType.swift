//
//  BoxSizingType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BoxSizingType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default. The width and height properties (and min/max properties) includes only the content. Border and padding are not included
    public static var contentBox: Self { .init("content-box") }
    
    /// The width and height properties (and min/max properties) includes content, padding and border
    public static var borderBox: Self { .init("border-box") }
    
    public var description: String { value }
}
