//
//  TransitionProperty.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the name of the CSS property the transition effect is for
///
/// ```html
/// div {
///     transition-property: width;
/// }
///
/// div:hover {
///     width: 300px;
/// }
/// ```
///
/// ```html
/// div {
///     transition-property: width, height;
/// }
///
/// div:hover {
///     width: 300px;
///     height: 300px;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-property.asp)
public class TransitionPropertyProperty: _Property {
    public var propertyKey: PropertyKey<TransitionPropertyType> { .transitionProperty }
    public var propertyValue: TransitionPropertyType
    var _content = _PropertyContent<TransitionPropertyType>()
    
    public init (_ type: TransitionPropertyType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var transitionProperty: PropertyKey<TransitionPropertyType> { "transition-property".propertyKey() }
}
