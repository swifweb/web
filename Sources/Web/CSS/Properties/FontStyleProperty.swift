//
//  FontStyle.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the font style for text
///
/// ```html
/// font-style: normal;
/// font-style: italic;
/// font-style: oblique;
/// font-style: oblique 10deg;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style)
public class FontStyleProperty: _Property {
    public var propertyKey: PropertyKey<FontStyleType> { .fontStyle }
    public var propertyValue: FontStyleType
    var _content = _PropertyContent<FontStyleType>()
    
    public init (_ type: FontStyleType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FontStyleType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FontStyleType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the font style for text
    public static var fontStyle: PropertyKey<FontStyleType> { "font-style".propertyKey() }
}

extension Stylesheet {
    /// Specifies the font style for text
    public typealias FontStyle = FontStyleProperty
}

extension CSSRulable {
    /// Specifies the font style for text
    public func fontStyle(_ type: FontStyleType) -> Self {
        s?._addProperty(.fontStyle, type)
        return self
    }

    /// Specifies the font style for text
    public func fontStyle(_ type: State<FontStyleType>) -> Self {
        s?._addProperty(FontStyleProperty(type))
        return self
    }

    /// Specifies the font style for text
    public func fontStyle<V>(_ type: ExpressableState<V, FontStyleType>) -> Self {
        fontStyle(type.unwrap())
    }
}
