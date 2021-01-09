//
//  ClearType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct ClearType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// No floating elements allowed on the left side
    public static var left: Self { .init("left") }
    
    /// No floating elements allowed on the right side
    public static var right: Self { .init("right") }
    
    /// No floating elements allowed on either the left or the right side
    public static var both: Self { .init("both") }
    
    public var description: String { value }
}
