//
//  TransitionTimingFunction.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the speed curve of the transition effect
///
/// ```html
/// div {
///     transition-timing-function: linear;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-timing-function.asp)
public class TransitionTimingFunctionProperty: _Property {
    public var propertyKey: PropertyKey<TransitionTimingFunctionType> { .transitionTimingFunction }
    public var propertyValue: TransitionTimingFunctionType
    var _content = _PropertyContent<TransitionTimingFunctionType>()
    
    public init (_ type: TransitionTimingFunctionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var transitionTimingFunction: PropertyKey<TransitionTimingFunctionType> { "transition-timing-function".propertyKey() }
}
