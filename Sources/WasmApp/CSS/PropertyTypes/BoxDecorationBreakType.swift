//
//  BoxDecorationBreakType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BoxDecorationBreakType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default. Box decorations are applied to the element
    /// as a whole and break at the edges of the element fragments
    public static var slice: Self { .init("slice") }
    
    /// Box decorations apply to each fragment of the element
    /// as if the fragments were individual elements.
    /// Borders wrap the four edges of each fragment of the element,
    /// and backgrounds are redrawn in full for each fragment
    public static var clone: Self { .init("clone") }
    
    public var description: String { value }
}
