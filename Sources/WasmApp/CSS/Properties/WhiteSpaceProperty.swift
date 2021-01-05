//
//  WhiteSpace.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how white-space inside an element is handled
///
/// ```html
/// p.a {
///     white-space: nowrap;
/// }
///
/// p.b {
///     white-space: normal;
/// }
///
/// p.c {
///     white-space: pre;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_white-space.asp)
public class WhiteSpaceProperty: _Property {
    public var propertyKey: PropertyKey<WhiteSpaceType> { .whiteSpace }
    public var propertyValue: WhiteSpaceType
    var _content = _PropertyContent<WhiteSpaceType>()
    
    public init (_ type: WhiteSpaceType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var whiteSpace: PropertyKey<WhiteSpaceType> { "white-space".propertyKey() }
}
