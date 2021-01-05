//
//  IsolationType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct IsolationType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// A new stacking context must be created
    public static var isolate: Self { .init("isolate") }
    
    public var description: String { value }
}
