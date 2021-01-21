//
//  GridAutoFlowType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct GridAutoFlowType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Places items by filling each row
    public static var row: Self { .init("row") }
    
    /// Places items by filling each column
    public static var column: Self { .init("column") }
    
    /// Place items to fill any holes in the grid
    public static var dense: Self { .init("dense") }
    
    /// Places items by filling each row, and fill any holes in the grid
    public static var rowDense: Self { .init("row dense") }
    
    /// Places items by filling each column, and fill any holes in the grid
    public static var columnDense: Self { .init("column dense") }
    
    public var description: String { value }
}
