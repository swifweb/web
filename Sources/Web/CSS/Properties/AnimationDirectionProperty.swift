//
//  AnimationDirection.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether an animation should be played forwards, backwards or in alternate cycles
///
/// ```html
/// animation-direction: alternate;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-direction.asp)
public class AnimationDirectionProperty: _Property {
    public var propertyKey: PropertyKey<AnimationDirectionType> { .animationDirection }
    public var propertyValue: AnimationDirectionType
    var _content = _PropertyContent<AnimationDirectionType>()
    
    public init (_ type: AnimationDirectionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<AnimationDirectionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, AnimationDirectionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether an animation should be played forwards, backwards or in alternate cycles
    public static var animationDirection: PropertyKey<AnimationDirectionType> { "animation-direction".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether an animation should be played forwards, backwards or in alternate cycles
    public typealias AnimationDirection = AnimationDirectionProperty
}

extension CSSRulable {
    /// Specifies whether an animation should be played forwards, backwards or in alternate cycles
    public func animationDirection(_ type: AnimationDirectionType) -> Self {
        s?._addProperty(.animationDirection, type)
        return self
    }

    /// Specifies whether an animation should be played forwards, backwards or in alternate cycles
    public func animationDirection(_ type: State<AnimationDirectionType>) -> Self {
        s?._addProperty(AnimationDirectionProperty(type))
        return self
    }

    /// Specifies whether an animation should be played forwards, backwards or in alternate cycles
    public func animationDirection<V>(_ type: ExpressableState<V, AnimationDirectionType>) -> Self {
        animationDirection(type.unwrap())
    }
}
