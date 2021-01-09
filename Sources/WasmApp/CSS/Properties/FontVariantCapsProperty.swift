//
//  FontVariantCaps.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs for capital letters
///
/// ```html
/// font-variant-caps: normal;
/// font-variant-caps: small-caps;
/// font-variant-caps: all-small-caps;
/// font-variant-caps: petite-caps;
/// font-variant-caps: all-petite-caps;
/// font-variant-caps: unicase;
/// font-variant-caps: titling-caps;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps)
public class FontVariantCapsProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantCapsValue> { .fontVariantCaps }
    public var propertyValue: FontVariantCapsValue
    var _content = _PropertyContent<FontVariantCapsValue>()
    
    public init (_ types: [FontVariantCapsType]) {
        propertyValue = .init(types)
    }
    
    public convenience init (_ types: FontVariantCapsType...) {
        self.init(types)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantCapsType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantCapsType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Controls the usage of alternate glyphs for capital letters
    public static var fontVariantCaps: PropertyKey<FontVariantCapsValue> { "font-variant-caps".propertyKey() }
}

public class FontVariantCapsValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: [FontVariantCapsType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public convenience init (_ type: FontVariantCapsType...) {
        self.init(type)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantCapsType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.map { $0.value }.joined(separator: " ")
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantCapsType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.value
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Controls the usage of alternate glyphs for capital letters
    public typealias FontVariantCaps = FontVariantCapsProperty
}

extension CSSRulable {
    /// Controls the usage of alternate glyphs for capital letters
    public func fontVariantCaps(_ types: [FontVariantCapsType]) -> Self {
        s?._addProperty(FontVariantCapsProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs for capital letters
    public func fontVariantCaps(_ types: FontVariantCapsType...) -> Self {
        fontVariantCaps(types)
    }
    
    /// Controls the usage of alternate glyphs for capital letters
    public func fontVariantCaps<V>(_ types: V) -> Self where V: StateConvertible, V.Value == [FontVariantCapsType] {
        s?._addProperty(FontVariantCapsProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs for capital letters
    public func fontVariantCaps<V>(_ types: V) -> Self where V: StateConvertible, V.Value == FontVariantCapsType {
        s?._addProperty(FontVariantCapsProperty(types))
        return self
    }
}
