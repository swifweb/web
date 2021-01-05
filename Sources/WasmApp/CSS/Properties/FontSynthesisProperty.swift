//
//  FontSynthesis.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls which missing typefaces (bold or italic) may be synthesized by the browser
///
/// ```html
/// font-synthesis: weight style;
/// font-synthesis: none;
/// font-synthesis: weight;
/// font-synthesis: style;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis)
public class FontSynthesisProperty: _Property {
    public var propertyKey: PropertyKey<FontSynthesisType> { .fontSynthesis }
    public var propertyValue: FontSynthesisType
    var _content = _PropertyContent<FontSynthesisType>()
    
    public init (_ type: FontSynthesisType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var fontSynthesis: PropertyKey<FontSynthesisType> { "font-synthesis".propertyKey() }
}
