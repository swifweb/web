//
//  JustifyContent.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the alignment between the items inside a flexible container when the items do not use all available space
///
/// ```html
/// justify-content: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_justify-content.asp)
public class JustifyContentProperty: _Property {
    public var propertyKey: PropertyKey<JustifyContentType> { .justifyContent }
    public var propertyValue: JustifyContentType
    var _content = _PropertyContent<JustifyContentType>()
    
    public init (_ type: JustifyContentType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var justifyContent: PropertyKey<JustifyContentType> { "justify-content".propertyKey() }
}
