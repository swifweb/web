//
//  UnitValueType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct UnitValueType: Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The browser calculates the width
    public static var auto: Self { .init("auto") }
    
    public var description: String { value }
}
