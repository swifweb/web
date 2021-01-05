//
//  TextOrientation.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines the orientation of the text in a line
///
/// ```html
/// text-orientation: mixed;
/// text-orientation: upright;
/// text-orientation: sideways-right;
/// text-orientation: sideways;
/// text-orientation: use-glyph-orientation;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation)
public class TextOrientationProperty: _Property {
    public var propertyKey: PropertyKey<TextOrientationType> { .textOrientation }
    public var propertyValue: TextOrientationType
    var _content = _PropertyContent<TextOrientationType>()
    
    public init (_ type: TextOrientationType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textOrientation: PropertyKey<TextOrientationType> { "text-orientation".propertyKey() }
}
