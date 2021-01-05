//
//  AnimationIterationCount.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the number of times an animation should be played
///
/// ```html
/// animation-iteration-count: 2;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-iteration-count.asp)
public class AnimationIterationCountProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .animationIterationCount }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ n: Int) {
        propertyValue = n
    }
}

extension PropertyKey {
    public static var animationIterationCount: PropertyKey<Int> { "animation-iteration-count".propertyKey() }
}
