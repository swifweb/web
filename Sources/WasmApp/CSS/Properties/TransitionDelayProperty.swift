//
//  TransitionDelay.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies when the transition effect will start
///
/// ```html
/// div {
///     transition-delay: 2s;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-delay.asp)
public class TransitionDelayProperty: _Property {
    public var propertyKey: PropertyKey<TimeType> { .transitionDelay }
    public var propertyValue: TimeType
    var _content = _PropertyContent<TimeType>()
    
    public init (_ type: TimeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var transitionDelay: PropertyKey<TimeType> { "transition-delay".propertyKey() }
}
