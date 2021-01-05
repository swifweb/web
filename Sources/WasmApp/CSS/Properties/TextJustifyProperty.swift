//
//  TextJustify.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the justification method used when text-align is "justify"
///
/// ```html
/// text-justify: none;
/// text-justify: auto;
/// text-justify: inter-word;
/// text-justify: inter-character;
/// text-justify: distribute; /* Deprecated value */
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/text-justify)
public class TextJustifyProperty: _Property {
    public var propertyKey: PropertyKey<TextJustifyType> { .textJustify }
    public var propertyValue: TextJustifyType
    var _content = _PropertyContent<TextJustifyType>()
    
    public init (_ type: TextJustifyType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textJustify: PropertyKey<TextJustifyType> { "text-justify".propertyKey() }
}
