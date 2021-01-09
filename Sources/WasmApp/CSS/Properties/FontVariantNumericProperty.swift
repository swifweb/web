//
//  FontVariantNumeric.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
///
/// ```html
/// font-variant-numeric: normal;
/// font-variant-numeric: ordinal;
/// font-variant-numeric: slashed-zero;
/// font-variant-numeric: lining-nums;         /* <numeric-figure-values> */
/// font-variant-numeric: oldstyle-nums;       /* <numeric-figure-values> */
/// font-variant-numeric: proportional-nums;   /* <numeric-spacing-values> */
/// font-variant-numeric: tabular-nums;        /* <numeric-spacing-values> */
/// font-variant-numeric: diagonal-fractions;  /* <numeric-fraction-values> */
/// font-variant-numeric: stacked-fractions;   /* <numeric-fraction-values> */
/// font-variant-numeric: oldstyle-nums stacked-fractions;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric)
public class FontVariantNumericProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantNumericValue> { .fontVariantNumeric }
    public var propertyValue: FontVariantNumericValue
    var _content = _PropertyContent<FontVariantNumericValue>()
    
    public init (_ types: [FontVariantNumericType]) {
        propertyValue = .init(types)
    }
    
    public convenience init (_ types: FontVariantNumericType...) {
        self.init(types)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantNumericType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantNumericType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
    public static var fontVariantNumeric: PropertyKey<FontVariantNumericValue> { "font-variant-numeric".propertyKey() }
}

public class FontVariantNumericValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: [FontVariantNumericType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public convenience init (_ type: FontVariantNumericType...) {
        self.init(type)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantNumericType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.map { $0.value }.joined(separator: " ")
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantNumericType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.value
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
    public typealias FontVariantNumeric = FontVariantNumericProperty
}

extension CSSRulable {
    /// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
    public func fontVariantNumeric(_ types: [FontVariantNumericType]) -> Self {
        s?._addProperty(FontVariantNumericProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
    public func fontVariantNumeric(_ types: FontVariantNumericType...) -> Self {
        fontVariantNumeric(types)
    }
    
    /// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
    public func fontVariantNumeric<V>(_ types: V) -> Self where V: StateConvertible, V.Value == [FontVariantNumericType] {
        s?._addProperty(FontVariantNumericProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs for numbers, fractions, and ordinal markers
    public func fontVariantNumeric<V>(_ types: V) -> Self where V: StateConvertible, V.Value == FontVariantNumericType {
        s?._addProperty(FontVariantNumericProperty(types))
        return self
    }
}
