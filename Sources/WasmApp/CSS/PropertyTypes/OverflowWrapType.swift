//
//  OverflowWrapType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public struct OverflowWrapType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Lines may only break at normal word break points (such as a space between two words).
    public static var normal: Self { .init("normal") }
    
    /// To prevent overflow, an otherwise unbreakable string
    /// of characters — like a long word or URL — may be broken at any point if there are no otherwise-acceptable
    /// break points in the line. No hyphenation character is inserted at the break point.
    /// Soft wrap opportunities introduced by the word break
    /// are considered when calculating min-content intrinsic sizes.
    public static var anywhere: Self { .init("anywhere") }
    
    /// The same as the anywhere value, with normally unbreakable words allowed
    /// to be broken at arbitrary points if there are no otherwise acceptable
    /// break points in the line, but soft wrap opportunities introduced
    /// by the word break are NOT considered when calculating min-content intrinsic sizes.
    public static var breakWord: Self { .init("break-word") }
    
    public var description: String { value }
}
