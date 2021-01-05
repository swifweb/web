//
//  TextUnderlinePosition.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the position of the underline which is set using the text-decoration property
///
/// ```html
/// /* Single keyword */
/// text-underline-position: auto;
/// text-underline-position: under;
/// text-underline-position: left;
/// text-underline-position: right;
///
/// /* Multiple keywords */
/// text-underline-position: under left;
/// text-underline-position: right under;
///
/// /* Global values */
/// text-underline-position: inherit;
/// text-underline-position: initial;
/// text-underline-position: unset;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/text-underline-position)
public class TextUnderlinePositionProperty: _Property {
    public var propertyKey: PropertyKey<[TextUnderlinePositionType]> { .textUnderlinePositions }
    public var propertyValue: [TextUnderlinePositionType]
    var _content = _PropertyContent<[TextUnderlinePositionType]>()
    
    public init (_ type: TextUnderlinePositionType...) {
        propertyValue = type
    }
    
    public init (_ types: [TextUnderlinePositionType]) {
        propertyValue = types
    }
}

extension PropertyKey {
    public static var textUnderlinePositions: PropertyKey<[TextUnderlinePositionType]> { "text-underline-position".propertyKey() }
    public static var textUnderlinePosition: PropertyKey<TextUnderlinePositionType> { "text-underline-position".propertyKey() }
}

extension Array where Element == TextUnderlinePositionType {
    public var description: String {
        map { $0.value }.joined(separator: " ")
    }
}
