//
//  BorderCollapseType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BorderCollapseType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Borders are separated; each cell will display its own borders.
    /// This is default.
    public static var separate: Self { .init("separate") }
    
    /// Borders are collapsed into a single border when possible
    /// (border-spacing and empty-cells properties have no effect)
    public static var collapse: Self { .init("collapse") }
    
    public var description: String { value }
}
