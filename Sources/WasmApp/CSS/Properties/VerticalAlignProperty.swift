//
//  VerticalAlign.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the vertical alignment of an element
///
/// ```html
/// img.a {
///     vertical-align: baseline;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_vertical-align.asp)
public class VerticalAlignProperty: _Property {
    public var propertyKey: PropertyKey<VerticalAlignType> { .verticalAlign }
    public var propertyValue: VerticalAlignType
    var _content = _PropertyContent<VerticalAlignType>()
    
    public init (_ type: VerticalAlignType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var verticalAlign: PropertyKey<VerticalAlignType> { "vertical-align".propertyKey() }
}
