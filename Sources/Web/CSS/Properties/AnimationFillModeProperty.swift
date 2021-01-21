//
//  AnimationFillMode.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies a style for the element when the animation is not playing (before it starts, after it ends, or both)
///
/// ```html
/// animation-fill-mode: forwards;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-fill-mode.asp)
public class AnimationFillModeProperty: _Property {
    public var propertyKey: PropertyKey<AnimationFillModeType> { .animationFillMode }
    public var propertyValue: AnimationFillModeType
    var _content = _PropertyContent<AnimationFillModeType>()
    
    public init (_ type: AnimationFillModeType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<AnimationFillModeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, AnimationFillModeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies a style for the element when the animation is not playing (before it starts, after it ends, or both)
    public static var animationFillMode: PropertyKey<AnimationFillModeType> { "animation-fill-mode".propertyKey() }
}

extension Stylesheet {
    /// Specifies a style for the element when the animation is not playing (before it starts, after it ends, or both)
    public typealias AnimationFillMode = AnimationFillModeProperty
}

extension CSSRulable {
    /// Specifies a style for the element when the animation is not playing (before it starts, after it ends, or both)
    public func animationFillMode(_ type: AnimationFillModeType) -> Self {
        s?._addProperty(.animationFillMode, type)
        return self
    }

    /// Specifies a style for the element when the animation is not playing (before it starts, after it ends, or both)
    public func animationFillMode(_ type: State<AnimationFillModeType>) -> Self {
        s?._addProperty(AnimationFillModeProperty(type))
        return self
    }

    /// Specifies a style for the element when the animation is not playing (before it starts, after it ends, or both)
    public func animationFillMode<V>(_ type: ExpressableState<V, AnimationFillModeType>) -> Self {
        animationFillMode(type.unwrap())
    }
}
