//
//  Inheritable.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol Inheritable: Valuable {
    static var inherit: Self { get }
}

extension Inheritable {
    public static var inherit: Self { .init("inherit") }
}
