//
//  FontVariantCapsType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol FontVariantCapsable: Valuable {
    static var smallCaps: Self { get }
    static var allSmallCaps: Self { get }
    static var petiteCaps: Self { get }
    static var allPetiteCaps: Self { get }
    static var unicase: Self { get }
    static var titlingCaps: Self { get }
}

extension FontVariantCapsable {
    /// Enables display of small capitals (OpenType feature: `smcp`).
    /// Small-caps glyphs typically use the form of uppercase letters
    /// but are reduced to the size of lowercase letters.
    public static var smallCaps: Self { .init("small-caps") }
    
    /// Enables display of small capitals for both upper
    /// and lowercase letters (OpenType features: `c2sc`, `smcp`).
    public static var allSmallCaps: Self { .init("all-small-caps") }
    
    /// Enables display of petite capitals (OpenType feature: `pcap`).
    public static var petiteCaps: Self { .init("petite-caps") }
    
    /// Enables display of petite capitals for both upper
    /// and lowercase letters (OpenType features: `c2pc`, `pcap`).
    public static var allPetiteCaps: Self { .init("all-petite-caps") }
    
    /// Enables display of mixture of small capitals for uppercase letters
    /// with normal lowercase letters (OpenType feature: `unic`).
    public static var unicase: Self { .init("unicase") }
    
    /// Enables display of titling capitals (OpenType feature: `titl`).
    /// Uppercase letter glyphs are often designed for use with lowercase letters.
    /// When used in all uppercase titling sequences they can appear too strong.
    /// Titling capitals are designed specifically for this situation.
    public static var titlingCaps: Self { .init("titling-caps") }
}

public struct FontVariantCapsType: FontVariantCapsable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    /// Deactivates of the use of alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
