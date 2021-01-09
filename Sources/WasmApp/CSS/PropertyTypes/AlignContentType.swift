//
//  AlignContentType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct AlignContentType: Initialable, Inheritable, Autoable, CustomStringConvertible {
    public let value: String

    public init (_ value: String) { self.value = value }

    /// The element is positioned to fit the container
    public static var stretch: Self { .init("stretch") }

    /// The element is positioned at the center of the container
    public static var center: Self { .init("center") }

    /// The element is positioned at the beginning of the container
    public static var flexStart: Self { .init("flex-start") }

    /// The element is positioned at the end of the container
    public static var flexEnd: Self { .init("flex-end") }
    
    /// Lines are evenly distributed in the flex container
    public static var spaceBetween: Self { .init("space-between") }
    
    /// Lines are evenly distributed in the flex container, with half-size spaces on either end
    public static var spaceAround: Self { .init("space-around") }

    /// The element is positioned at the baseline of the container
    public static var baseline: Self { .init("baseline") }
    
    public var description: String { value }
}
