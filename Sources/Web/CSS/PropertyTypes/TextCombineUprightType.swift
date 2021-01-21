//
//  TextCombineUprightType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextCombineUprightType: Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Attempts to typeset all consecutive characters within the box horizontally, such that they take up the space of a single character within the vertical line of the box.
    public static var all: Self { .init("all") }
    
    /// Attempts to display a sequence of consecutive ASCII digits (U+0030–U+0039)
    /// that has as many or fewer characters than the specified integer,
    /// such that it takes up the space of a single character within the vertical line box.
    /// If the integer is omitted, it computes to 2. Integers outside the range of 2-4 are invalid.
    public static func digits(_ n: Int?) -> Self {
        guard let n = n else { return .init("digits") }
        return .init("digits \(n)")
    }
    
    public var description: String { value }
}
