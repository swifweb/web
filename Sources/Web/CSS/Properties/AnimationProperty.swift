//
//  AAA.swift
//  Web
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
    
    public convenience init (_ type: State<AnimationValue>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, AnimationValue>) {
        self.init(type.unwrap())
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
        propertyValue = AnimationValue(
            name: name,
            duration: duration,
            timing: timing,
            delay: delay,
            iterationCount: iterationCount,
            direction: direction,
            fillMode: fillMode,
            playState: playState
        )
    }
}

extension PropertyKey {
    /// A shorthand property for all the animation-* properties
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

extension Stylesheet {
    /// A shorthand property for all the animation-* properties
    public typealias Animation = AnimationProperty
}

extension CSSRulable {
    /// A shorthand property for all the animation-* properties
    public func animation(_ type: AnimationValue) -> Self {
        s?._addProperty(.animation, type)
        return self
    }

    /// A shorthand property for all the animation-* properties
    public func animation(_ type: State<AnimationValue>) -> Self {
        s?._addProperty(AnimationProperty(type))
        return self
    }

    /// A shorthand property for all the animation-* properties
    public func animation<V>(_ type: ExpressableState<V, AnimationValue>) -> Self {
        animation(type.unwrap())
    }
    
    /// A shorthand property for all the animation-* properties
    public func animation<D1: TimeUnitValue, D2: TimeUnitValue>(
        name: String? = nil,
        duration: D1? = nil,
        timing: TransitionTimingFunctionType? = nil,
        delay: D2? = nil,
        iterationCount: Int? = nil,
        direction: AnimationDirectionType? = nil,
        fillMode: AnimationFillModeType? = nil,
        playState: AnimationPlayStateType? = nil
    ) -> Self {
        s?._addProperty(AnimationProperty(
            name: name,
            duration: duration,
            timing: timing,
            delay: delay,
            iterationCount: iterationCount,
            direction: direction,
            fillMode: fillMode,
            playState: playState
        ))
        return self
    }
}
