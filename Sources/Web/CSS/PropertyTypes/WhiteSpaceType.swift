//
//  WhiteSpaceType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct WhiteSpaceType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary. This is default
    public static var normal: Self { .init("normal") }
    
    /// Sequences of whitespace will collapse into a single whitespace. Text will never wrap to the next line. The text continues on the same line until a `<br>` tag is encountered
    public static var nowrap: Self { .init("nowrap") }
    
    /// Whitespace is preserved by the browser. Text will only wrap on line breaks. Acts like the `<pre>` tag in HTML
    public static var pre: Self { .init("pre") }
    
    /// Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary, and on line breaks
    public static var preLine: Self { .init("pre-line") }
    
    /// Whitespace is preserved by the browser. Text will wrap when necessary, and on line breaks
    public static var preWrap: Self { .init("pre-wrap") }
    
    public var description: String { value }
}
