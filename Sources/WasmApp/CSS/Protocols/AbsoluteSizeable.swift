//
//  AbsoluteSizeable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol AbsoluteSizeable: Valuable {
    static var xxSmall: Self { get }
    static var xSmall: Self { get }
    static var small: Self { get }
    static var medium: Self { get }
    static var large: Self { get }
    static var xLarge: Self { get }
    static var xxLarge: Self { get }
    static var xxxLarge: Self { get }
}

extension AbsoluteSizeable {
    public static var xxSmall: Self { .init("xx-small") }
    public static var xSmall: Self { .init("x-small") }
    public static var small: Self { .init("small") }
    public static var medium: Self { .init("medium") }
    public static var large: Self { .init("large") }
    public static var xLarge: Self { .init("x-large") }
    public static var xxLarge: Self { .init("xx-large") }
    public static var xxxLarge: Self { .init("xxx-large") }
}
