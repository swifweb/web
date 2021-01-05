//
//  AAA.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// A shorthand property for all the animation-* properties
///
/// ```html
/// animation: mymove 5s infinite;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation.asp)
public class AnimationProperty: _Property {
    public var propertyKey: PropertyKey<AnimationValue> { .animation }
    public var propertyValue: AnimationValue
    var _content = _PropertyContent<AnimationValue>()
    
    public init (_ value: AnimationValue) {
        propertyValue = value
    }
    
    public init<D1: TimeUnitValue, D2: TimeUnitValue>(
        name: String? = nil,
        duration: D1? = nil,
        timing: TransitionTimingFunctionType? = nil,
        delay: D2? = nil,
        iterationCount: Int? = nil,
        direction: AnimationDirectionType? = nil,
        fillMode: AnimationFillModeType? = nil,
        playState: AnimationPlayStateType? = nil
    ) {
        propertyValue = AnimationValue(name: name, duration: duration, timing: timing, delay: delay, iterationCount: iterationCount, direction: direction, fillMode: fillMode, playState: playState)
    }
}

extension PropertyKey {
    public static var animation: PropertyKey<AnimationValue> { "animation".propertyKey() }
}

public struct AnimationValue: CustomStringConvertible {
    public let value: String
    
    public init<D1: TimeUnitValue, D2: TimeUnitValue>(
        name: String? = nil,
        duration: D1? = nil,
        timing: TransitionTimingFunctionType? = nil,
        delay: D2? = nil,
        iterationCount: Int? = nil,
        direction: AnimationDirectionType? = nil,
        fillMode: AnimationFillModeType? = nil,
        playState: AnimationPlayStateType? = nil
    ) {
        var ic: String?
        if let iterationCount = iterationCount {
            ic = "\(iterationCount)"
        }
        value = [
            name,
            duration?.description,
            timing?.value,
            delay?.description,
            ic,
            direction?.value,
            fillMode?.value,
            playState?.value
        ]
        .compactMap { $0 }
        .joined(separator: " ")
    }
    
    public var description: String { value }
}
