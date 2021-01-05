//
//  AlignItemsType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct AlignItemsType: Initialable, Inheritable, Autoable, CustomStringConvertible {
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
    
    /// The element is positioned at the baseline of the container
    public static var baseline: Self { .init("baseline") }
    
    public var description: String { value }
}
