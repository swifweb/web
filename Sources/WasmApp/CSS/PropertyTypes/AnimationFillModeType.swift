//
//  AnimationFillModeType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct AnimationFillModeType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element will retain the style values that is set by the last keyframe
    /// (depends on animation-direction and animation-iteration-count)
    public static var forwards: Self { .init("forwards") }
    
    /// The element will get the style values that is set by the first keyframe
    /// (depends on animation-direction), and retain this during the animation-delay period
    public static var backwards: Self { .init("backwards") }
    
    /// The animation will follow the rules for both forwards
    /// and backwards, extending the animation properties in both directions
    public static var both: Self { .init("both") }
    
    public var description: String { value }
}
