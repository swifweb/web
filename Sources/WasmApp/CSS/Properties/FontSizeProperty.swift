//
//  FontSize.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the font size of text
///
/// ```html
/// /* <absolute-size> values */
/// font-size: xx-small;
/// font-size: x-small;
/// font-size: small;
/// font-size: medium;
/// font-size: large;
/// font-size: x-large;
/// font-size: xx-large;
/// font-size: xxx-large;
///
/// /* <relative-size> values */
/// font-size: smaller;
/// font-size: larger;
///
/// /* <length> values */
/// font-size: 12px;
/// font-size: 0.8em;
///
/// /* <percentage> values */
/// font-size: 80%;
///
/// /* Global values */
/// font-size: inherit;
/// font-size: initial;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size)
public class FontSizeProperty: _Property {
    public var propertyKey: PropertyKey<FontSizeType> { .fontSize }
    public var propertyValue: FontSizeType
    var _content = _PropertyContent<FontSizeType>()
    
    public init (_ type: FontSizeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var fontSize: PropertyKey<FontSizeType> { "font-size".propertyKey() }
}
