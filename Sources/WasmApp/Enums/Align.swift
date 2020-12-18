//
//  Align.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public final class Align {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Left align data, left justify text.
    public static var left: Align { .init("left") }
    
    /// Center align data, center justify text.
    public static var center: Align { .init("center") }
    
    /// Right align data, right justify text.
    public static var right: Align { .init("right") }
    
    /// Double justify text.
    public static var justify: Align { .init("justify") }
    
    /// If used, text is aligned around a specific character.
    public static var char: Align { .init("char") }
}

extension Align: CustomStringConvertible {
    public var description: String { value }
}
