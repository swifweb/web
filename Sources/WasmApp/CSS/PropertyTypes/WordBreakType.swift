//
//  WordBreakType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct WordBreakType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Uses default line break rules
    public static var normal: Self { .init("normal") }
    
    /// To prevent overflow, word may be broken at any character
    public static var breakAll: Self { .init("break-all") }
    
    /// Word breaks should not be used for Chinese/Japanese/Korean (CJK) text.
    /// Non-CJK text behavior is the same as value "normal"
    public static var keepAll: Self { .init("keep-all") }
    
    /// To prevent overflow, word may be broken at arbitrary points
    public static var breakWord: Self { .init("break-word") }
    
    public var description: String { value }
}
