//
//  UnicodeBidiType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct UnicodeBidiType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element does not open an additional level of embedding. This is default
    public static var normal: Self { .init("normal") }
    
    /// For inline elements, this value opens an additional level of embedding
    public static var embed: Self { .init("embed") }
    
    /// For inline elements, this creates an override. For block elements, this creates an override for inline-level descendants not within another block element
    public static var bidiOverride: Self { .init("bidi-override") }
    
    /// The element is isolated from its siblings
    public static var isolate: Self { .init("isolate") }
    
    public static var isolateOverride: Self { .init("isolate-override") }
    
    public static var plaintext: Self { .init("plaintext") }
    
    public var description: String { value }
}
