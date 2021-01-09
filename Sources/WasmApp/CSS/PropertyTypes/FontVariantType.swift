//
//  FontVariantType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontVariantType: Noneable, FontVariantNumericable, FontVariantEastAsianable, FontVariantCapsable, FontVariantAlternatable, FontVariantLigaturable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a normal font face; each of the longhand properties has an initial value of normal.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
