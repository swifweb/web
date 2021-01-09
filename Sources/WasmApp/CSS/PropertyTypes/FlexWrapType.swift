//
//  FlexWrapType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct FlexWrapType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Specifies that the flexible items will not wrap
    public static var nowrap: Self { .init("nowrap") }
    
    /// Specifies that the flexible items will wrap if necessary
    public static var wrap: Self { .init("wrap") }
    
    /// Specifies that the flexible items will wrap, if necessary, in reverse order
    public static var wrapReverse: Self { .init("wrap-reverse") }
    
    public var description: String { value }
}
