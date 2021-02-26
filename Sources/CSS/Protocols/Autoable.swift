//
//  Autoable.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol Autoable: Valuable {
    static var auto: Self { get }
}

extension Autoable {
    /// The user agent uses its own algorithm for this value
    public static var auto: Self { .init("auto") }
}
