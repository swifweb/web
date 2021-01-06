//
//  Resize.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines if (and how) an element is resizable by the user
///
/// ```html
/// div {
///     resize: both;
///     overflow: auto;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_resize.asp)
public class ResizeProperty: _Property {
    public var propertyKey: PropertyKey<ResizeType> { .resize }
    public var propertyValue: ResizeType
    var _content = _PropertyContent<ResizeType>()
    
    public init (_ type: ResizeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var resize: PropertyKey<ResizeType> { "resize".propertyKey() }
}
