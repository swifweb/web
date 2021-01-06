//
//  TextAlign.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the horizontal alignment of text
///
/// ```html
/// text-align: center;
/// text-align: left;
/// text-align: right;
/// text-align: justify;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-align.asp)
public class TextAlignProperty: _Property {
    public var propertyKey: PropertyKey<TextAlignType> { .textAlign }
    public var propertyValue: TextAlignType
    var _content = _PropertyContent<TextAlignType>()
    
    public init (_ type: TextAlignType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TextAlignType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextAlignType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the horizontal alignment of text
    public static var textAlign: PropertyKey<TextAlignType> { "text-align".propertyKey() }
}

extension Stylesheet {
    /// Specifies the horizontal alignment of text
    public typealias TextAlign = TextAlignProperty
}

extension CSSRulable {
    /// Specifies the horizontal alignment of text
    public func textAlign(_ type: TextAlignType) -> Self {
        s?._addProperty(.textAlign, type)
        return self
    }

    /// Specifies the horizontal alignment of text
    public func textAlign(_ type: State<TextAlignType>) -> Self {
        s?._addProperty(TextAlignProperty(type))
        return self
    }

    /// Specifies the horizontal alignment of text
    public func textAlign<V>(_ type: ExpressableState<V, TextAlignType>) -> Self {
        textAlign(type.unwrap())
    }
}
