//
//  TextDecorationLine.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the type of line in a text-decoration
///
/// ```html
/// div.a {
///     text-decoration-line: overline;
/// }
///
/// div.b {
///     text-decoration-line: underline;
/// }
///
/// div.c {
///     text-decoration-line: line-through;
/// }
///
/// div.d {
///     text-decoration-line: overline underline;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-decoration-line.asp)
public class TextDecorationLineProperty: _Property {
    public var propertyKey: PropertyKey<TextDecorationLineType> { .textDecorationLine }
    public var propertyValue: TextDecorationLineType
    var _content = _PropertyContent<TextDecorationLineType>()
    
    public init (_ type: TextDecorationLineType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TextDecorationLineType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextDecorationLineType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the type of line in a text-decoration
    public static var textDecorationLine: PropertyKey<TextDecorationLineType> { "text-decoration-line".propertyKey() }
}

extension Stylesheet {
    /// Specifies the type of line in a text-decoration
    public typealias TextDecorationLine = TextDecorationLineProperty
}

extension CSSRulable {
    /// Specifies the type of line in a text-decoration
    public func textDecorationLine(_ type: TextDecorationLineType) -> Self {
        s?._addProperty(.textDecorationLine, type)
        return self
    }

    /// Specifies the type of line in a text-decoration
    public func textDecorationLine(_ type: State<TextDecorationLineType>) -> Self {
        s?._addProperty(TextDecorationLineProperty(type))
        return self
    }

    /// Specifies the type of line in a text-decoration
    public func textDecorationLine<V>(_ type: ExpressableState<V, TextDecorationLineType>) -> Self {
        textDecorationLine(type.unwrap())
    }
}
