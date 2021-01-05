//
//  AnimationDirection.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var animationDirection: PropertyKey<AnimationDirectionType> { "animation-direction".propertyKey() }
}
