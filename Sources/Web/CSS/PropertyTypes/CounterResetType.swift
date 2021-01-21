//
//  CounterResetType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct CounterResetType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The id defines which counter to reset.
    /// The number sets the value the counter is reset to on each occurrence of the selector.
    /// The default number value is 0
    public static func id(name: String, id: Int) -> Self { .init(name + " \(id)") }
    
    public var description: String { value }
}
