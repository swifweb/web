//
//  FontStretch.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Selects a normal, condensed, or expanded face from a font family
///
/// ```html
/// /* Keyword values */
/// font-stretch: ultra-condensed;
/// font-stretch: extra-condensed;
/// font-stretch: condensed;
/// font-stretch: semi-condensed;
/// font-stretch: normal;
/// font-stretch: semi-expanded;
/// font-stretch: expanded;
/// font-stretch: extra-expanded;
/// font-stretch: ultra-expanded;
///
/// /* Percentage values */
/// font-stretch: 50%;
/// font-stretch: 100%;
/// font-stretch: 200%;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-stretch)
public class FontStretchProperty: _Property {
    public var propertyKey: PropertyKey<FontStretchType> { .fontStretch }
    public var propertyValue: FontStretchType
    var _content = _PropertyContent<FontStretchType>()
    
    public init (_ type: FontStretchType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var fontStretch: PropertyKey<FontStretchType> { "font-stretch".propertyKey() }
}
