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
    
    public convenience init (_ type: State<FontLanguageOverrideType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FontLanguageOverrideType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Controls the usage of language-specific glyphs in a typeface
    public static var fontLanguageOverride: PropertyKey<FontLanguageOverrideType> { "font-language-override".propertyKey() }
}

extension Stylesheet {
    /// Controls the usage of language-specific glyphs in a typeface
    public typealias FontLanguageOverride = FontLanguageOverrideProperty
}

extension CSSRulable {
    /// Controls the usage of language-specific glyphs in a typeface
    public func fontLanguageOverride(_ type: FontLanguageOverrideType) -> Self {
        s?._addProperty(.fontLanguageOverride, type)
        return self
    }

    /// Controls the usage of language-specific glyphs in a typeface
    public func fontLanguageOverride(_ type: State<FontLanguageOverrideType>) -> Self {
        s?._addProperty(FontLanguageOverrideProperty(type))
        return self
    }

    /// Controls the usage of language-specific glyphs in a typeface
    public func fontLanguageOverride<V>(_ type: ExpressableState<V, FontLanguageOverrideType>) -> Self {
        fontLanguageOverride(type.unwrap())
    }
}
