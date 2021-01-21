//
//  AlignType.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public final class AlignType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Left align data, left justify text.
    public static var left: AlignType { .init("left") }
    
    /// Center align data, center justify text.
    public static var center: AlignType { .init("center") }
    
    /// Right align data, right justify text.
    public static var right: AlignType { .init("right") }
    
    /// Double justify text.
    public static var justify: AlignType { .init("justify") }
    
    /// If used, text is aligned around a specific character.
    public static var char: AlignType { .init("char") }
}

extension AlignType: CustomStringConvertible {
    public var description: String { value }
}
