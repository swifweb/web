//
//  UnicodeBidi.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Used together with the direction property to set or return whether the text
/// should be overridden to support multiple languages in the same document
///
/// ```html
/// div {
///    direction: rtl;
///    unicode-bidi: bidi-override;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_unicode-bidi.asp)
public class UnicodeBidiProperty: _Property {
    public var propertyKey: PropertyKey<UnicodeBidiType> { .unicodeBidi }
    public var propertyValue: UnicodeBidiType
    var _content = _PropertyContent<UnicodeBidiType>()
    
    public init (_ type: UnicodeBidiType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<UnicodeBidiType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, UnicodeBidiType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Used together with the direction property to set or return whether the text
    /// should be overridden to support multiple languages in the same document
    public static var unicodeBidi: PropertyKey<UnicodeBidiType> { "unicode-bidi".propertyKey() }
}

extension Stylesheet {
    /// Used together with the direction property to set or return whether the text
    /// should be overridden to support multiple languages in the same document
    public typealias UnicodeBidi = UnicodeBidiProperty
}

extension CSSRulable {
    /// Used together with the direction property to set or return whether the text
    /// should be overridden to support multiple languages in the same document
    public func unicodeBidi(_ type: UnicodeBidiType) -> Self {
        s?._addProperty(.unicodeBidi, type)
        return self
    }

    /// Used together with the direction property to set or return whether the text
    /// should be overridden to support multiple languages in the same document
    public func unicodeBidi(_ type: State<UnicodeBidiType>) -> Self {
        s?._addProperty(UnicodeBidiProperty(type))
        return self
    }

    /// Used together with the direction property to set or return whether the text
    /// should be overridden to support multiple languages in the same document
    public func unicodeBidi<V>(_ type: ExpressableState<V, UnicodeBidiType>) -> Self {
        unicodeBidi(type.unwrap())
    }
}
