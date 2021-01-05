//
//  Position.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the type of positioning method used for an element (static, relative, absolute or fixed)
///
/// ```html
/// h2 {
///     position: absolute;
///     left: 100px;
///     top: 150px;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_position.asp)
public class PositionProperty: _Property {
    public var propertyKey: PropertyKey<PositionType> { .position }
    public var propertyValue: PositionType
    var _content = _PropertyContent<PositionType>()
    
    public init (_ type: PositionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var position: PropertyKey<PositionType> { "position".propertyKey() }
}
