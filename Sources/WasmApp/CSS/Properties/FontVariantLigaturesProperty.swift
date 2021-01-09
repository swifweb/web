//
//  FontVariantLigatures.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
///
/// ```html
/// font-variant-ligatures: normal;
/// font-variant-ligatures: none;
/// font-variant-ligatures: common-ligatures;           /* <common-lig-values> */
/// font-variant-ligatures: no-common-ligatures;        /* <common-lig-values> */
/// font-variant-ligatures: discretionary-ligatures;    /* <discretionary-lig-values> */
/// font-variant-ligatures: no-discretionary-ligatures; /* <discretionary-lig-values> */
/// font-variant-ligatures: historical-ligatures;       /* <historical-lig-values> */
/// font-variant-ligatures: no-historical-ligatures;    /* <historical-lig-values> */
/// font-variant-ligatures: contextual;                 /* <contextual-alt-values> */
/// font-variant-ligatures: no-contextual;              /* <contextual-alt-values> */
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures)
public class FontVariantLigaturesProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantLigaturesValue> { .fontVariantLigatures }
    public var propertyValue: FontVariantLigaturesValue
    var _content = _PropertyContent<FontVariantLigaturesValue>()
    
    public init (_ types: [FontVariantLigaturesType]) {
        propertyValue = .init(types)
    }
    
    public convenience init (_ types: FontVariantLigaturesType...) {
        self.init(types)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantLigaturesType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantLigaturesType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
    public static var fontVariantLigatures: PropertyKey<FontVariantLigaturesValue> { "font-variant-ligatures".propertyKey() }
}

public class FontVariantLigaturesValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: [FontVariantLigaturesType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public convenience init (_ type: FontVariantLigaturesType...) {
        self.init(type)
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == [FontVariantLigaturesType] {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.map { $0.value }.joined(separator: " ")
        }
    }
    
    public convenience init <V>(_ types: V) where V: StateConvertible, V.Value == FontVariantLigaturesType {
        let types = types.stateValue
        self.init(types.wrappedValue)
        types.listen {
            self.value = $0.value
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
    public typealias FontVariantLigatures = FontVariantLigaturesProperty
}

extension CSSRulable {
    /// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
    public func fontVariantLigatures(_ types: [FontVariantLigaturesType]) -> Self {
        s?._addProperty(FontVariantLigaturesProperty(types))
        return self
    }
    
    /// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
    public func fontVariantLigatures(_ types: FontVariantLigaturesType...) -> Self {
        fontVariantLigatures(types)
    }
    
    /// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
    public func fontVariantLigatures<V>(_ types: V) -> Self where V: StateConvertible, V.Value == [FontVariantLigaturesType] {
        s?._addProperty(FontVariantLigaturesProperty(types))
        return self
    }
    
    /// Controls which ligatures and contextual forms are used in textual content of the elements it applies to
    public func fontVariantLigatures<V>(_ types: V) -> Self where V: StateConvertible, V.Value == FontVariantLigaturesType {
        s?._addProperty(FontVariantLigaturesProperty(types))
        return self
    }
}
