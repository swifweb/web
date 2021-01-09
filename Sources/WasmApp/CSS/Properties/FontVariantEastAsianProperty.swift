//
//  FontVariantEastAsian.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
///
/// ```html
/// font-variant-east-asian: normal;
/// font-variant-east-asian: ruby;
/// font-variant-east-asian: jis78;              /* <east-asian-variant-values> */
/// font-variant-east-asian: jis83;              /* <east-asian-variant-values> */
/// font-variant-east-asian: jis90;              /* <east-asian-variant-values> */
/// font-variant-east-asian: jis04;              /* <east-asian-variant-values> */
/// font-variant-east-asian: simplified;         /* <east-asian-variant-values> */
/// font-variant-east-asian: traditional;        /* <east-asian-variant-values> */
/// font-variant-east-asian: full-width;         /* <east-asian-width-values> */
/// font-variant-east-asian: proportional-width; /* <east-asian-width-values> */
/// font-variant-east-asian: ruby full-width jis83;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian)
public class FontVariantEastAsianProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantEastAsianValue> { .fontVariantEastAsian }
    public var propertyValue: FontVariantEastAsianValue
    var _content = _PropertyContent<FontVariantEastAsianValue>()
    
    public init (_ types: [FontVariantEastAsianType]) {
        propertyValue = .init(types)
    }
    
    public convenience init (_ types: FontVariantEastAsianType...) {
        self.init(types)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantEastAsianType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantEastAsianType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
    public static var fontVariantEastAsian: PropertyKey<FontVariantEastAsianValue> { "font-variant-east-asian".propertyKey() }
}

public class FontVariantEastAsianValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: [FontVariantEastAsianType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public convenience init (_ type: FontVariantEastAsianType...) {
        self.init(type)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantEastAsianType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.map { $0.value }.joined(separator: " ")
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantEastAsianType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.value
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
    public typealias FontVariantEastAsian = FontVariantEastAsianProperty
}

extension CSSRulable {
    /// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
    public func fontVariantEastAsian(_ types: [FontVariantEastAsianType]) -> Self {
        s?._addProperty(FontVariantEastAsianProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
    public func fontVariantEastAsian(_ types: FontVariantEastAsianType...) -> Self {
        fontVariantEastAsian(types)
    }
    
    /// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
    public func fontVariantEastAsian<V>(_ types: V) -> Self where V: StateConvertible, V.Value == [FontVariantEastAsianType] {
        s?._addProperty(FontVariantEastAsianProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs for East Asian scripts (e.g Japanese and Chinese)
    public func fontVariantEastAsian<V>(_ types: V) -> Self where V: StateConvertible, V.Value == FontVariantEastAsianType {
        s?._addProperty(FontVariantEastAsianProperty(types))
        return self
    }
}
