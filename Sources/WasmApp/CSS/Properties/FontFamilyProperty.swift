//
//  FontFamily.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the font family for text
///
/// ```html
/// font-family: Georgia, serif;
/// font-family: "Gill Sans", sans-serif;
/// font-family: sans-serif;
/// font-family: serif;
/// font-family: cursive;
/// font-family: system-ui;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family)
public class FontFamilyProperty: _Property {
    public var propertyKey: PropertyKey<FontFamilyValue> { .fontFamily }
    public var propertyValue: FontFamilyValue
    var _content = _PropertyContent<FontFamilyValue>()
    
    public init (_ types: [FontFamilyType]) {
        propertyValue = .init(types)
    }
    
    public convenience init (_ types: FontFamilyType...) {
        self.init(types)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontFamilyType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontFamilyType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Specifies the font family for text
    public static var fontFamily: PropertyKey<FontFamilyValue> { "font-family".propertyKey() }
}

public class FontFamilyValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: [FontFamilyType]) {
        value = type.map { $0.value }.joined(separator: ", ")
    }
    
    public convenience init (_ type: FontFamilyType...) {
        self.init(type)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontFamilyType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.map { $0.value }.joined(separator: ", ")
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontFamilyType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.value
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies the font family for text
    public typealias FontFamily = FontFamilyProperty
}

extension CSSRulable {
    /// Specifies the font family for text
    public func fontFamily(_ types: [FontFamilyType]) -> Self {
        s?._addProperty(FontFamilyProperty(types))
        return self
    }
    
    /// Specifies the font family for text
    public func fontFamily(_ types: FontFamilyType...) -> Self {
        fontFamily(types)
    }
    
    /// Specifies the font family for text
    public func fontFamily<V>(_ types: V) -> Self where V: StateConvertible, V.Value == [FontFamilyType] {
        s?._addProperty(FontFamilyProperty(types))
        return self
    }
    
    /// Specifies the font family for text
    public func fontFamily<V>(_ types: V) -> Self where V: StateConvertible, V.Value == FontFamilyType {
        s?._addProperty(FontFamilyProperty(types))
        return self
    }
}
