//
//  ColumnRuleWidthType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct ColumnRuleWidthType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Defines a medium rule
    public static var medium: Self { .init("medium") }
    
    /// Defines a thin rule
    public static var thin: Self { .init("thin") }
    
    /// Defines a thick rule
    public static var thick: Self { .init("thick") }
    
    public var description: String { value }
}
