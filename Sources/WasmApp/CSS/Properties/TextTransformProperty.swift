//
//  TextTransform.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Controls the capitalization of text
///
/// ```html
/// div.a {
///     text-transform: uppercase;
/// }
///
/// div.b {
///     text-transform: lowercase;
/// }
///
/// div.c {
///     text-transform: capitalize;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-transform.asp)
public class TextTransformProperty: _Property {
    public var propertyKey: PropertyKey<TextTransformType> { .textTransform }
    public var propertyValue: TextTransformType
    var _content = _PropertyContent<TextTransformType>()
    
    public init (_ type: TextTransformType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TextTransformType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextTransformType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Controls the capitalization of text
    public static var textTransform: PropertyKey<TextTransformType> { "text-transform".propertyKey() }
}

extension Stylesheet {
    /// Controls the capitalization of text
    public typealias TextTransform = TextTransformProperty
}

extension CSSRulable {
    /// Controls the capitalization of text
    public func textTransform(_ type: TextTransformType) -> Self {
        s?._addProperty(.textTransform, type)
        return self
    }

    /// Controls the capitalization of text
    public func textTransform(_ type: State<TextTransformType>) -> Self {
        s?._addProperty(TextTransformProperty(type))
        return self
    }

    /// Controls the capitalization of text
    public func textTransform<V>(_ type: ExpressableState<V, TextTransformType>) -> Self {
        textTransform(type.unwrap())
    }
}
