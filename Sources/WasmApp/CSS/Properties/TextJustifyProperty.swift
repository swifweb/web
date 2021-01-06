//
//  TextJustify.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the justification method used when text-align is "justify"
///
/// ```html
/// text-justify: none;
/// text-justify: auto;
/// text-justify: inter-word;
/// text-justify: inter-character;
/// text-justify: distribute; /* Deprecated value */
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/text-justify)
public class TextJustifyProperty: _Property {
    public var propertyKey: PropertyKey<TextJustifyType> { .textJustify }
    public var propertyValue: TextJustifyType
    var _content = _PropertyContent<TextJustifyType>()
    
    public init (_ type: TextJustifyType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TextJustifyType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextJustifyType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the justification method used when text-align is "justify"
    public static var textJustify: PropertyKey<TextJustifyType> { "text-justify".propertyKey() }
}

extension Stylesheet {
    /// Specifies the justification method used when text-align is "justify"
    public typealias TextJustify = TextJustifyProperty
}

extension CSSRulable {
    /// Specifies the justification method used when text-align is "justify"
    public func textJustify(_ type: TextJustifyType) -> Self {
        s?._addProperty(.textJustify, type)
        return self
    }

    /// Specifies the justification method used when text-align is "justify"
    public func textJustify(_ type: State<TextJustifyType>) -> Self {
        s?._addProperty(TextJustifyProperty(type))
        return self
    }

    /// Specifies the justification method used when text-align is "justify"
    public func textJustify<V>(_ type: ExpressableState<V, TextJustifyType>) -> Self {
        textJustify(type.unwrap())
    }
}
