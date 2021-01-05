//
//  FontKerningType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontKerningType: Autoable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Font kerning information stored in the font must be applied.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
