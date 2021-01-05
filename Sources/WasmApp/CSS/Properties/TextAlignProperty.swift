//
//  TextAlign.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the horizontal alignment of text
///
/// ```html
/// text-align: center;
/// text-align: left;
/// text-align: right;
/// text-align: justify;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-align.asp)
public class TextAlignProperty: _Property {
    public var propertyKey: PropertyKey<TextAlignType> { .textAlign }
    public var propertyValue: TextAlignType
    var _content = _PropertyContent<TextAlignType>()
    
    public init (_ type: TextAlignType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textAlign: PropertyKey<TextAlignType> { "text-align".propertyKey() }
}
