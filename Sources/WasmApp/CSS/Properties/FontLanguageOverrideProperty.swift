//
//  FontLanguageOverride.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of language-specific glyphs in a typeface
///
/// ```html
/// /* Keyword value */
/// font-language-override: normal;
///
/// /* <string> values */
/// font-language-override: "ENG";  /* Use English glyphs */
/// font-language-override: "TRK";  /* Use Turkish glyphs */
///
/// /* Global values */
/// font-language-override: initial;
/// font-language-override: inherit;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-language-override)
public class FontLanguageOverrideProperty: _Property {
    public var propertyKey: PropertyKey<FontLanguageOverrideType> { .fontLanguageOverride }
    public var propertyValue: FontLanguageOverrideType
    var _content = _PropertyContent<FontLanguageOverrideType>()
    
    public init (_ type: FontLanguageOverrideType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var fontLanguageOverride: PropertyKey<FontLanguageOverrideType> { "font-language-override".propertyKey() }
}
