//
//  TableLayoutType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TableLayoutType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sets a fixed table layout algorithm.
    /// The table and column widths are set by the widths
    /// of table and col or by the width of the first row of cells.
    /// Cells in other rows do not affect column widths.
    /// If no widths are present on the first row, the column widths are divided equally
    /// across the table, regardless of content inside the cells
    public static var fixed: Self { .init("fixed") }
    
    public var description: String { value }
}
