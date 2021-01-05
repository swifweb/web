//
//  TextAlignLast.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Describes how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"
///
/// ```html
/// text-align-last: right;
/// text-align-last: center;
/// text-align-last: justify;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-align-last.asp)
public class TextAlignLastProperty: _Property {
    public var propertyKey: PropertyKey<TextAlignLastType> { .textAlignLast }
    public var propertyValue: TextAlignLastType
    var _content = _PropertyContent<TextAlignLastType>()
    
    public init (_ type: TextAlignLastType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textAlignLast: PropertyKey<TextAlignLastType> { "text-align-last".propertyKey() }
}
