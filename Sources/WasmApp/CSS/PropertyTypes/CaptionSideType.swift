//
//  CaptionSideType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct CaptionSideType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Puts the caption above the table. This is default
    public static var top: Self { .init("top") }
    
    /// Puts the caption below the table
    public static var bottom: Self { .init("bottom") }
    
    public var description: String { value }
}
