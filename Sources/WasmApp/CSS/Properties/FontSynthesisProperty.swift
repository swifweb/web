//
//  FontSynthesis.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls which missing typefaces (bold or italic) may be synthesized by the browser
///
/// ```html
/// font-synthesis: weight style;
/// font-synthesis: none;
/// font-synthesis: weight;
/// font-synthesis: style;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis)
public class FontSynthesisProperty: _Property {
    public var propertyKey: PropertyKey<FontSynthesisType> { .fontSynthesis }
    public var propertyValue: FontSynthesisType
    var _content = _PropertyContent<FontSynthesisType>()
    
    public init (_ type: FontSynthesisType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FontSynthesisType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FontSynthesisType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Controls which missing typefaces (bold or italic) may be synthesized by the browser
    public static var fontSynthesis: PropertyKey<FontSynthesisType> { "font-synthesis".propertyKey() }
}

extension Stylesheet {
    /// Controls which missing typefaces (bold or italic) may be synthesized by the browser
    public typealias FontSynthesis = FontSynthesisProperty
}

extension CSSRulable {
    /// Controls which missing typefaces (bold or italic) may be synthesized by the browser
    public func fontSynthesis(_ type: FontSynthesisType) -> Self {
        s?._addProperty(.fontSynthesis, type)
        return self
    }

    /// Controls which missing typefaces (bold or italic) may be synthesized by the browser
    public func fontSynthesis(_ type: State<FontSynthesisType>) -> Self {
        s?._addProperty(FontSynthesisProperty(type))
        return self
    }

    /// Controls which missing typefaces (bold or italic) may be synthesized by the browser
    public func fontSynthesis<V>(_ type: ExpressableState<V, FontSynthesisType>) -> Self {
        fontSynthesis(type.unwrap())
    }
}
