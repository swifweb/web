//
//  RelativeSizeable.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol RelativeSizeable: Valuable {
    static var smaller: Self { get }
    static var larger: Self { get }
}

extension RelativeSizeable {
    public static var smaller: Self { .init("smaller") }
    public static var larger: Self { .init("larger") }
}
