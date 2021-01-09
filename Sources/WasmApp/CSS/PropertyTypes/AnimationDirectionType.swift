//
//  AnimationDirectionType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct AnimationDirectionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The animation is played as normal (forwards)
    public static var normal: Self { .init("normal") }
    
    /// The animation is played in reverse direction (backwards)
    public static var reverse: Self { .init("reverse") }
    
    /// The animation is played forwards first, then backwards
    public static var alternate: Self { .init("alternate") }
    
    /// The animation is played backwards first, then forwards
    public static var alternateReverse: Self { .init("alternate-reverse") }
    
    public var description: String { value }
}
