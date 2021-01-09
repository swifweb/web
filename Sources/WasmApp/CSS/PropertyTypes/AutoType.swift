//
//  AutoType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 15.07.2020.
//

public struct AutoType: Initialable, Inheritable, Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}
