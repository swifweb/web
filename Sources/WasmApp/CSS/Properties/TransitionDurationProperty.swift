//
//  TransitionDuration.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how many seconds or milliseconds a transition effect takes to complete
///
/// ```html
/// div {
///     transition-duration: 5s;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-duration.asp)
public class TransitionDurationProperty: _Property {
    public var propertyKey: PropertyKey<TimeType> { .transitionDuration }
    public var propertyValue: TimeType
    var _content = _PropertyContent<TimeType>()
    
    public init (_ type: TimeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var transitionDuration: PropertyKey<TimeType> { "transition-duration".propertyKey() }
}
