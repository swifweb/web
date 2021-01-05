//
//  AnimationDelay.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies a delay for the start of an animation
///
/// ```html
/// animation-delay: 2s;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-delay.asp)
public class AnimationDelayProperty: _Property {
    public var propertyKey: PropertyKey<TimeUnitValueContainer> { .animationDelay }
    public var propertyValue: TimeUnitValueContainer
    var _content = _PropertyContent<TimeUnitValueContainer>()
    
    public init<T: TimeUnitValue>(_ t: T) {
        propertyValue = TimeUnitValueContainer(value: t.value.doubleValue, timeUnit: t.timeUnit)
    }
}

extension PropertyKey {
    public static var animationDelay: PropertyKey<TimeUnitValueContainer> { "animation-delay".propertyKey() }
}
