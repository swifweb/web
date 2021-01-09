//
//  FontVariant.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies whether or not a text should be displayed in a small-caps font
///
/// ```html
/// font-variant: small-caps;
/// font-variant: common-ligatures small-caps;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant)
public class FontVariantProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantValue> { .fontVariant }
    public var propertyValue: FontVariantValue
    var _content = _PropertyContent<FontVariantValue>()
    
    public init (_ types: [FontVariantType]) {
        propertyValue = .init(types)
    }
    
    public convenience init (_ types: FontVariantType...) {
        self.init(types)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Specifies whether or not a text should be displayed in a small-caps font
    public static var fontVariant: PropertyKey<FontVariantValue> { "font-variant".propertyKey() }
}

public class FontVariantValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: [FontVariantType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public convenience init (_ type: FontVariantType...) {
        self.init(type)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.map { $0.value }.joined(separator: " ")
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.value
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies whether or not a text should be displayed in a small-caps font
    public typealias FontVariant = FontVariantProperty
}

extension CSSRulable {
    /// Specifies whether or not a text should be displayed in a small-caps font
    public func fontVariant(_ types: [FontVariantType]) -> Self {
        s?._addProperty(FontVariantProperty(types))
        return self
    }
    
    /// Specifies whether or not a text should be displayed in a small-caps font
    public func fontVariant(_ types: FontVariantType...) -> Self {
        fontVariant(types)
    }
    
    /// Specifies whether or not a text should be displayed in a small-caps font
    public func fontVariant<V>(_ types: V) -> Self where V: StateConvertible, V.Value == [FontVariantType] {
        s?._addProperty(FontVariantProperty(types))
        return self
    }
    
    /// Specifies whether or not a text should be displayed in a small-caps font
    public func fontVariant<V>(_ types: V) -> Self where V: StateConvertible, V.Value == FontVariantType {
        s?._addProperty(FontVariantProperty(types))
        return self
    }
}
