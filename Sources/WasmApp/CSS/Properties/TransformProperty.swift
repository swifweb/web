//
//  Transform.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Applies a 2D or 3D transformation to an element
///
/// ```html
/// div.a {
///     transform: rotate(20deg);
/// }
///
/// div.b {
///     transform: skewY(20deg);
/// }
///
/// div.c {
///     transform: scaleY(1.5);
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transform.asp)
public class TransformProperty: _Property {
    public var propertyKey: PropertyKey<TransformFunction> { .transform }
    public var propertyValue: TransformFunction
    var _content = _PropertyContent<TransformFunction>()
    
    public init (_ func: TransformFunction) {
        propertyValue = `func`
    }
}

extension PropertyKey {
    public static var transform: PropertyKey<TransformFunction> { "transform".propertyKey() }
}
