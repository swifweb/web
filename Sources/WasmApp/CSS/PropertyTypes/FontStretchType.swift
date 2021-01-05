//
//  FontStretchType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct FontStretchType: Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a normal font face.
    public static var normal: Self { .init("normal") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var semiCondensed: Self { .init("semi-condensed") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var condensed: Self { .init("condensed") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var extraCondensed: Self { .init("extra-condensed") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var ultraCondensed: Self { .init("ultra-condensed") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var semiExpanded: Self { .init("semi-expanded") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var expanded: Self { .init("expanded") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var extraExpanded: Self { .init("extra-expanded") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var ultraExpanded: Self { .init("ultra-expanded") }
    
    public var description: String { value }
}
