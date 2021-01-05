//
//  TransformOrigin.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Allows you to change the position on transformed elements
///
/// ```html
/// div {
///     transform: rotate(45deg);
///     transform-origin: 20% 40%;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transform-origin.asp)
public class TransformOriginProperty: _Property {
    public var propertyKey: PropertyKey<TransformOriginType> { .transformOrigin }
    public var propertyValue: TransformOriginType
    var _content = _PropertyContent<TransformOriginType>()
    
    public init (_ type: TransformOriginType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var transformOrigin: PropertyKey<TransformOriginType> { "transform-origin".propertyKey() }
}
