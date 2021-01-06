//
//  FontKerning.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of the kerning information (how letters are spaced)
///
/// ```html
/// font-kerning: auto;
/// font-kerning: normal;
/// font-kerning: none;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-kerning)
public class FontKerningProperty: _Property {
    public var propertyKey: PropertyKey<FontKerningType> { .fontKerning }
    public var propertyValue: FontKerningType
    var _content = _PropertyContent<FontKerningType>()
    
    public init (_ type: FontKerningType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FontKerningType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FontKerningType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Controls the usage of the kerning information (how letters are spaced)
    public static var fontKerning: PropertyKey<FontKerningType> { "font-kerning".propertyKey() }
}

extension Stylesheet {
    /// Controls the usage of the kerning information (how letters are spaced)
    public typealias FontKerning = FontKerningProperty
}

extension CSSRulable {
    /// Controls the usage of the kerning information (how letters are spaced)
    public func fontKerning(_ type: FontKerningType) -> Self {
        s?._addProperty(.fontKerning, type)
        return self
    }

    /// Controls the usage of the kerning information (how letters are spaced)
    public func fontKerning(_ type: State<FontKerningType>) -> Self {
        s?._addProperty(FontKerningProperty(type))
        return self
    }

    /// Controls the usage of the kerning information (how letters are spaced)
    public func fontKerning<V>(_ type: ExpressableState<V, FontKerningType>) -> Self {
        fontKerning(type.unwrap())
    }
}
