//
//  Percentable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol Percentable: Valuable {
    /// Defines value in percent of the containing block
    static func percent(_ v: Double) -> Self
}

extension Percentable {
    /// Defines value in percent of the containing block
    public static func percent(_ v: Double) -> Self { .init("\(v)%") }
}
