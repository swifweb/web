//
//  TextOverflow.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies what should happen when text overflows the containing element
///
/// ```html
/// div {
///     white-space: nowrap;
///     overflow: hidden;
///     text-overflow: ellipsis;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-overflow.asp)
public class TextOverflowProperty: _Property {
    public var propertyKey: PropertyKey<TextOverflowType> { .textOverflow }
    public var propertyValue: TextOverflowType
    var _content = _PropertyContent<TextOverflowType>()
    
    public init (_ type: TextOverflowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textOverflow: PropertyKey<TextOverflowType> { "text-overflow".propertyKey() }
}
