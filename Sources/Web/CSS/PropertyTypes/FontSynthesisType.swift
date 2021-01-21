//
//  FontSynthesisType.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontSynthesisType: Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword indicates that a bold typeface may be synthesized if needed.
    public static var weight: Self { .init("weight") }
    
    /// This keyword indicates that an italic typeface may be synthesized if needed.
    public static var style: Self { .init("style") }
    
    public var description: String { value }
}
