//
//  HangingPunctuationType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct HangingPunctuationType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Punctuation may hang outside the start edge of the first line
    public static var first: Self { .init("first") }
    
    /// Punctuation may hang outside the end edge of the last line
    public static var last: Self { .init("last") }
    
    /// Punctuation may hang outside the end edge of all lines if the punctuation does not otherwise fit prior to justification
    public static var allowEnd: Self { .init("allow-end") }
    
    /// Punctuation may hang outside the end edge of all lines. If justification is enabled on this line, then it will force the punctuation to hang
    public static var forceEnd: Self { .init("force-end") }
    
    public var description: String { value }
}
