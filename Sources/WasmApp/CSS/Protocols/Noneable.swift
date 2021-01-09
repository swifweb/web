//
//  Noneable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol Noneable: Valuable {
    static var none: Self { get }
}

extension Noneable {
    /// The user agent uses its own algorithm for this value
    public static var none: Self { .init("none") }
}
