//
//  Numberable.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol Numberable: Valuable {
    static func number(_ v: NumericValue) -> Self
}

extension Numberable {
    /// A number
    public static func number(_ v: NumericValue) -> Self { .init(v.numericValue) }
}
