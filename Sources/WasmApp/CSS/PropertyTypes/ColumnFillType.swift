//
//  ColumnFillType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct ColumnFillType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value.
    /// Fills each column with about the same amount of content,
    /// but will not allow the columns to be taller than the height
    /// (so, columns might be shorter than the height
    /// as the browser distributes the content evenly horizontally)
    public static var balance: Self { .init("balance") }
    
    public var description: String { value }
}
