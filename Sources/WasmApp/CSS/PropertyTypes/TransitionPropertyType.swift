//
//  TransitionPropertyType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TransitionPropertyType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// No property will get a transition effect
    public static var none: Self { .init("") }
    
    /// Default value. All properties will get a transition effect
    public static var all: Self { .init("all") }
    
    /// Defines a comma separated list of CSS property names the transition effect is for
    public static func property(_ properties: PropertyType...) -> Self {
        property(properties)
    }
    
    /// Defines a comma separated list of CSS property names the transition effect is for
    public static func property(_ properties: [PropertyType]) -> Self {
        .init(properties.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public var description: String { value }
}
