//
//  Lengthable.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol Lengthable: Valuable {
    /// Defines value in px, cm, etc.
    ///
    /// [Read about length units](https://www.w3schools.com/cssref/css_units.asp)
    static func length<L: UnitValuable>(_ v: L) -> Self
}

extension Lengthable {
    /// Defines value in px, cm, etc.
    ///
    /// [Read about length units](https://www.w3schools.com/cssref/css_units.asp)
    public static func length<L: UnitValuable>(_ v: L) -> Self { .init(v.description) }
}
