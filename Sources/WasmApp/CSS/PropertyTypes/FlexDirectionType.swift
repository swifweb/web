//
//  FlexDirectionType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct FlexDirectionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The flexible items are displayed horizontally, as a row
    public static var row: Self { .init("row") }
    
    /// Same as row, but in reverse order
    public static var rowReverse: Self { .init("row-reverse") }
    
    /// The flexible items are displayed vertically, as a column
    public static var column: Self { .init("column") }
    
    /// Same as column, but in reverse order
    public static var columnReverse: Self { .init("column-reverse") }
    
    public var description: String { value }
}
