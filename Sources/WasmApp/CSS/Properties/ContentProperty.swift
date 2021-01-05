//
//  Content.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Used with the :before and :after pseudo-elements, to insert generated content
///
/// ```html
/// content: "•";
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_gen_content.asp)
public class ContentProperty: _Property {
    public var propertyKey: PropertyKey<ContentType> { .content }
    public var propertyValue: ContentType
    var _content = _PropertyContent<ContentType>()
    
    public init (_ type: ContentType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var content: PropertyKey<ContentType> { "content".propertyKey() }
}
