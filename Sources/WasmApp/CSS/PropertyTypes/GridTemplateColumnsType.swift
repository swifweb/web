//
//  GridTemplateColumnsType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct GridTemplateColumnsType: Noneable, Autoable, Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sets the size of each column to depend on the largest item in the column
    public static var maxContent: Self { .init("max-content") }
    
    /// Sets the size of each column to depend on the smallest item in the column
    public static var minContent: Self { .init("min-content") }
    
    public var description: String { value }
}
