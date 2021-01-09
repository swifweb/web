//
//  BorderImageOutsetType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct BorderImageOutsetType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Represent multiples of the corresponding border-width
    public static func number(_ n: NumericValue) -> Self { .init(n.numericValue) }
    
    public var description: String { value }
}
