//
//  TextDecorationStyle.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the style of the line in a text decoration
///
/// ```html
/// div.a {
///     text-decoration-line: underline;
///     text-decoration-style: solid;
/// }
///
/// div.b {
///     text-decoration-line: underline;
///     text-decoration-style: wavy;
/// }
///
/// div.c {
///     text-decoration-line: underline;
///     text-decoration-style: double;
/// }
///
/// div.d {
///     text-decoration-line: overline underline;
///     text-decoration-style: wavy;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-decoration-style.asp)
public class TextDecorationStyleProperty: _Property {
    public var propertyKey: PropertyKey<TextDecorationStyleType> { .textDecorationStyle }
    public var propertyValue: TextDecorationStyleType
    var _content = _PropertyContent<TextDecorationStyleType>()
    
    public init (_ type: TextDecorationStyleType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TextDecorationStyleType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextDecorationStyleType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the style of the line in a text decoration
    public static var textDecorationStyle: PropertyKey<TextDecorationStyleType> { "text-decoration-style".propertyKey() }
}

extension Stylesheet {
    /// Specifies the style of the line in a text decoration
    public typealias TextDecorationStyle = TextDecorationStyleProperty
}

extension CSSRulable {
    /// Specifies the style of the line in a text decoration
    public func textDecorationStyle(_ type: TextDecorationStyleType) -> Self {
        s?._addProperty(.textDecorationStyle, type)
        return self
    }

    /// Specifies the style of the line in a text decoration
    public func textDecorationStyle(_ type: State<TextDecorationStyleType>) -> Self {
        s?._addProperty(TextDecorationStyleProperty(type))
        return self
    }

    /// Specifies the style of the line in a text decoration
    public func textDecorationStyle<V>(_ type: ExpressableState<V, TextDecorationStyleType>) -> Self {
        textDecorationStyle(type.unwrap())
    }
}
