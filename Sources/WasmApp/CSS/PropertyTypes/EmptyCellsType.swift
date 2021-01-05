//
//  EmptyCellsType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct EmptyCellsType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Display borders on empty cells. This is default
    public static var show: Self { .init("show") }
    
    /// Hide borders on empty cells
    public static var hide: Self { .init("hide") }
    
    public var description: String { value }
}
