//
//  TextIndent.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the indentation of the first line in a text-block
///
/// ```html
/// div.a {
///     text-indent: 50px;
/// }
///
/// div.b {
///     text-indent: -2em;
/// }
///
/// div.c {
///     text-indent: 30%;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-indent.asp)
public class TextIndentProperty: _Property {
    public var propertyKey: PropertyKey<TextIndentType> { .textIndent }
    public var propertyValue: TextIndentType
    var _content = _PropertyContent<TextIndentType>()
    
    public init (_ type: TextIndentType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TextIndentType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextIndentType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the indentation of the first line in a text-block
    public static var textIndent: PropertyKey<TextIndentType> { "text-indent".propertyKey() }
}

extension Stylesheet {
    /// Specifies the indentation of the first line in a text-block
    public typealias TextIndent = TextIndentProperty
}

extension CSSRulable {
    /// Specifies the indentation of the first line in a text-block
    public func textIndent(_ type: TextIndentType) -> Self {
        s?._addProperty(.textIndent, type)
        return self
    }

    /// Specifies the indentation of the first line in a text-block
    public func textIndent(_ type: State<TextIndentType>) -> Self {
        s?._addProperty(TextIndentProperty(type))
        return self
    }

    /// Specifies the indentation of the first line in a text-block
    public func textIndent<V>(_ type: ExpressableState<V, TextIndentType>) -> Self {
        textIndent(type.unwrap())
    }
}
