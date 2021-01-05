//
//  AnimationTimingFunction.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var animationTimingFunction: PropertyKey<TransitionTimingFunctionType> { "animation-timing-function".propertyKey() }
}
