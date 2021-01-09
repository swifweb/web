//
//  Initialable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol Initialable: Valuable {
    static var initial: Self { get }
}

extension Initialable {
    public static var initial: Self { .init("initial") }
}
