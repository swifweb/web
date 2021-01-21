//
//  AnimationTimingFunction.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the speed curve of an animation
///
/// ```html
/// animation-timing-function: linear;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-timing-function.asp)
public class AnimationTimingFunctionProperty: _Property {
    public var propertyKey: PropertyKey<TransitionTimingFunctionType> { .animationTimingFunction }
    public var propertyValue: TransitionTimingFunctionType
    var _content = _PropertyContent<TransitionTimingFunctionType>()
    
    public init (_ type: TransitionTimingFunctionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TransitionTimingFunctionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TransitionTimingFunctionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the speed curve of an animation
    public static var animationTimingFunction: PropertyKey<TransitionTimingFunctionType> { "animation-timing-function".propertyKey() }
}

extension Stylesheet {
    /// Specifies the speed curve of an animation
    public typealias AnimationTimingFunction = AnimationTimingFunctionProperty
}

extension CSSRulable {
    /// Specifies the speed curve of an animation
    public func animationTimingFunction(_ type: TransitionTimingFunctionType) -> Self {
        s?._addProperty(.animationTimingFunction, type)
        return self
    }

    /// Specifies the speed curve of an animation
    public func animationTimingFunction(_ type: State<TransitionTimingFunctionType>) -> Self {
        s?._addProperty(AnimationTimingFunctionProperty(type))
        return self
    }

    /// Specifies the speed curve of an animation
    public func animationTimingFunction<V>(_ type: ExpressableState<V, TransitionTimingFunctionType>) -> Self {
        animationTimingFunction(type.unwrap())
    }
}
