//
//  QuotesType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct QuotesType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies which quotation marks to use.
    /// The first two values specifies the first level of quotation embedding,
    /// the next two values specifies the next level of quote embedding, etc
    public static func string(_ a: String, _ b: String, c: String, _ d: String) -> Self { .init([a, b, c, d].joined(separator: " ")) }
    
    /// Specifies which quotation marks to use.
    /// The first two values specifies the first level of quotation embedding,
    /// the next two values specifies the next level of quote embedding, etc
    public static func string(_ v: String) -> Self { .init(v) }
    
    public var description: String { value }
}
