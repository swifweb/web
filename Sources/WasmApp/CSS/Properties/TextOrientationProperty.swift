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
    
    public convenience init (_ type: State<TextOrientationType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextOrientationType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines the orientation of the text in a line
    public static var textOrientation: PropertyKey<TextOrientationType> { "text-orientation".propertyKey() }
}

extension Stylesheet {
    /// Defines the orientation of the text in a line
    public typealias TextOrientation = TextOrientationProperty
}

extension CSSRulable {
    /// Defines the orientation of the text in a line
    public func textOrientation(_ type: TextOrientationType) -> Self {
        s?._addProperty(.textOrientation, type)
        return self
    }

    /// Defines the orientation of the text in a line
    public func textOrientation(_ type: State<TextOrientationType>) -> Self {
        s?._addProperty(TextOrientationProperty(type))
        return self
    }

    /// Defines the orientation of the text in a line
    public func textOrientation<V>(_ type: ExpressableState<V, TextOrientationType>) -> Self {
        textOrientation(type.unwrap())
    }
}
