//
//  AnimationPlayState.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether the animation is running or paused
///
/// ```html
/// animation-play-state: paused;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-play-state.asp)
public class AnimationPlayStateProperty: _Property {
    public var propertyKey: PropertyKey<AnimationPlayStateType> { .animationPlayState }
    public var propertyValue: AnimationPlayStateType
    var _content = _PropertyContent<AnimationPlayStateType>()
    
    public init (_ type: AnimationPlayStateType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<AnimationPlayStateType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, AnimationPlayStateType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether the animation is running or paused
    public static var animationPlayState: PropertyKey<AnimationPlayStateType> { "animation-play-state".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether the animation is running or paused
    public typealias AnimationPlayState = AnimationPlayStateProperty
}

extension CSSRulable {
    /// Specifies whether the animation is running or paused
    public func animationPlayState(_ type: AnimationPlayStateType) -> Self {
        s?._addProperty(.animationPlayState, type)
        return self
    }

    /// Specifies whether the animation is running or paused
    public func animationPlayState(_ type: State<AnimationPlayStateType>) -> Self {
        s?._addProperty(AnimationPlayStateProperty(type))
        return self
    }

    /// Specifies whether the animation is running or paused
    public func animationPlayState<V>(_ type: ExpressableState<V, AnimationPlayStateType>) -> Self {
        animationPlayState(type.unwrap())
    }
}
