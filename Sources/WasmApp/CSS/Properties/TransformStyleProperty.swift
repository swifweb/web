//
//  TransformStyle.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how nested elements are rendered in 3D space
///
/// ```html
/// div {
///     transform: rotateY(60deg);
///     transform-style: preserve-3d;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transform-style.asp)
public class TransformStyleProperty: _Property {
    public var propertyKey: PropertyKey<TransformStyleType> { .transformStyle }
    public var propertyValue: TransformStyleType
    var _content = _PropertyContent<TransformStyleType>()
    
    public init (_ type: TransformStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var transformStyle: PropertyKey<TransformStyleType> { "transform-style".propertyKey() }
}
