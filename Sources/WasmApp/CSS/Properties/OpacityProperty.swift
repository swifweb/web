//
//  Opacity.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the opacity level for an element
///
/// ```html
/// opacity: 0.5
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_opacity.asp)
public class OpacityProperty: _Property {
    public var propertyKey: PropertyKey<NumericValueContainer> { .opacity }
    public var propertyValue: NumericValueContainer
    var _content = _PropertyContent<NumericValueContainer>()
    
    public init (_ v: NumericValue) {
        propertyValue = NumericValueContainer(v)
    }
}

extension PropertyKey {
    public static var opacity: PropertyKey<NumericValueContainer> { "opacity".propertyKey() }
}
