//
//  FontVariantPosition.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs of smaller size positioned as superscript or subscript regarding the baseline of the font
///
/// ```html
/// font-variant-position: normal;
/// font-variant-position: sub;
/// font-variant-position: super;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-position)
public class FontVariantPositionProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantPositionType> { .fontVariantPosition }
    public var propertyValue: FontVariantPositionType
    var _content = _PropertyContent<FontVariantPositionType>()
    
    public init (_ type: FontVariantPositionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FontVariantPositionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FontVariantPositionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Controls the usage of alternate glyphs of smaller size positioned as superscript or subscript regarding the baseline of the font
    public static var fontVariantPosition: PropertyKey<FontVariantPositionType> { "font-variant-position".propertyKey() }
}

extension Stylesheet {
    /// Controls the usage of alternate glyphs of smaller size positioned as superscript or subscript regarding the baseline of the font
    public typealias FontVariantPosition = FontVariantPositionProperty
}

extension CSSRulable {
    /// Controls the usage of alternate glyphs of smaller size positioned as superscript or subscript regarding the baseline of the font
    public func fontVariantPosition(_ type: FontVariantPositionType) -> Self {
        s?._addProperty(.fontVariantPosition, type)
        return self
    }

    /// Controls the usage of alternate glyphs of smaller size positioned as superscript or subscript regarding the baseline of the font
    public func fontVariantPosition(_ type: State<FontVariantPositionType>) -> Self {
        s?._addProperty(FontVariantPositionProperty(type))
        return self
    }

    /// Controls the usage of alternate glyphs of smaller size positioned as superscript or subscript regarding the baseline of the font
    public func fontVariantPosition<V>(_ type: ExpressableState<V, FontVariantPositionType>) -> Self {
        fontVariantPosition(type.unwrap())
    }
}
