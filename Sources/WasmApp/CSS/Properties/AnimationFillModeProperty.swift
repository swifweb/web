//
//  AnimationFillMode.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var animationFillMode: PropertyKey<AnimationFillModeType> { "animation-fill-mode".propertyKey() }
}
