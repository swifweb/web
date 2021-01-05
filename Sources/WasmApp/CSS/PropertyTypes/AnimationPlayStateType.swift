//
//  AnimationPlayStateType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct AnimationPlayStateType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies that the animation is paused
    public static var paused: Self { .init("paused") }
    
    /// Default value. Specifies that the animation is running
    public static var running: Self { .init("running") }
    
    public var description: String { value }
}
