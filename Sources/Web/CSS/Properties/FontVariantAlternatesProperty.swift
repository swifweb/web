//
//  FontVariantAlternates.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
///
/// ```html
/// /* Keyword values */
/// font-variant-alternates: normal;
/// font-variant-alternates: historical-forms;
///
/// /* Functional notation values */
/// font-variant-alternates: stylistic(user-defined-ident);
/// font-variant-alternates: styleset(user-defined-ident);
/// font-variant-alternates: character-variant(user-defined-ident);
/// font-variant-alternates: swash(user-defined-ident);
/// font-variant-alternates: ornaments(user-defined-ident);
/// font-variant-alternates: annotation(user-defined-ident);
/// font-variant-alternates: swash(ident1) annotation(ident2);
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-alternates)
public class FontVariantAlternatesProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantAlternatesValue> { .fontVariantAlternates }
    public var propertyValue: FontVariantAlternatesValue
    var _content = _PropertyContent<FontVariantAlternatesValue>()
    
    public init (_ types: [FontVariantAlternatesType]) {
        propertyValue = .init(types)
    }
    
    public convenience init (_ types: FontVariantAlternatesType...) {
        self.init(types)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantAlternatesType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantAlternatesType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
    public static var fontVariantAlternates: PropertyKey<FontVariantAlternatesValue> { "font-variant-alternates".propertyKey() }
}

public class FontVariantAlternatesValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: [FontVariantAlternatesType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public convenience init (_ type: FontVariantAlternatesType...) {
        self.init(type)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantAlternatesType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.map { $0.value }.joined(separator: " ")
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantAlternatesType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.value
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
    public typealias FontVariantAlternates = FontVariantAlternatesProperty
}

extension CSSRulable {
    /// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
    public func fontVariantAlternates(_ types: [FontVariantAlternatesType]) -> Self {
        s?._addProperty(FontVariantAlternatesProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
    public func fontVariantAlternates(_ types: FontVariantAlternatesType...) -> Self {
        fontVariantAlternates(types)
    }
    
    /// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
    public func fontVariantAlternates<V>(_ types: V) -> Self where V: StateConvertible, V.Value == [FontVariantAlternatesType] {
        s?._addProperty(FontVariantAlternatesProperty(types))
        return self
    }
    
    /// Controls the usage of alternate glyphs associated to alternative names defined in @font-feature-values
    public func fontVariantAlternates<V>(_ types: V) -> Self where V: StateConvertible, V.Value == FontVariantAlternatesType {
        s?._addProperty(FontVariantAlternatesProperty(types))
        return self
    }
}
