//
//  AnimationDuration.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how long an animation should take to complete one cycle
///
/// ```html
/// animation-duration: 3s;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-duration.asp)
public class AnimationDurationProperty: _Property {
    public var propertyKey: PropertyKey<TimeUnitValueContainer> { .animationDuration }
    public var propertyValue: TimeUnitValueContainer
    var _content = _PropertyContent<TimeUnitValueContainer>()
    
    public init (_ value: TimeUnitValueContainer) {
        propertyValue = value
    }
    
    public init<T: TimeUnitValue>(_ t: T) {
        propertyValue = TimeUnitValueContainer(value: t.value.doubleValue, timeUnit: t.timeUnit)
    }
}

extension PropertyKey {
    public static var animationDuration: PropertyKey<TimeUnitValueContainer> { "animation-duration".propertyKey() }
}
