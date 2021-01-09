//
//  ColumnSpanType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct ColumnSpanType: Initialable, Inheritable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element should span across all columns
    public static var all: Self { .init("all") }
    
    public var description: String { value }
}
