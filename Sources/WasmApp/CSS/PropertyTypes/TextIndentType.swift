//
//  TextIndentType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextIndentType: Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}
