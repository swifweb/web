//
//  FontSize.swift
//  Web
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
    
    public convenience init (_ type: State<FontSizeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FontSizeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the font size of text
    public static var fontSize: PropertyKey<FontSizeType> { "font-size".propertyKey() }
}

extension Stylesheet {
    /// Specifies the font size of text
    public typealias FontSize = FontSizeProperty
}

extension CSSRulable {
    /// Specifies the font size of text
    public func fontSize(_ type: FontSizeType) -> Self {
        s?._addProperty(.fontSize, type)
        return self
    }

    /// Specifies the font size of text
    public func fontSize(_ type: State<FontSizeType>) -> Self {
        s?._addProperty(FontSizeProperty(type))
        return self
    }

    /// Specifies the font size of text
    public func fontSize<V>(_ type: ExpressableState<V, FontSizeType>) -> Self {
        fontSize(type.unwrap())
    }
    
    /// Specifies the font size of text
    public func fontSize<L: UnitValuable>(_ length: L) -> Self {
        fontSize(.length(length))
    }
    
    /// Specifies the font size of text
    public func fontSize<L: UnitValuable>(_ type: State<L>) -> Self {
        fontSize(type.map { .length($0) })
    }

    /// Specifies the font size of text
    public func fontSize<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        fontSize(type.unwrap())
    }
}
