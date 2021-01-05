//
//  UnicodeBidi.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Used together with the direction property to set or return whether the text should be overridden to support multiple languages in the same document
///
/// ```html
/// div {
///    direction: rtl;
///    unicode-bidi: bidi-override;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_unicode-bidi.asp)
public class UnicodeBidiProperty: _Property {
    public var propertyKey: PropertyKey<UnicodeBidiType> { .unicodeBidi }
    public var propertyValue: UnicodeBidiType
    var _content = _PropertyContent<UnicodeBidiType>()
    
    public init (_ type: UnicodeBidiType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var unicodeBidi: PropertyKey<UnicodeBidiType> { "unicode-bidi".propertyKey() }
}
