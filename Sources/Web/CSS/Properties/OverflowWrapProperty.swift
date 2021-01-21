//
//  OverflowWrapProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies whether or not the browser may break lines within words
/// in order to prevent overflow (when a string is too long to fit its containing box)
///
/// ```html
/// overflow-wrap: normal;
/// overflow-wrap: break-word;
/// overflow-wrap: anywhere;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap)
public class OverflowWrapProperty: _Property {
    public var propertyKey: PropertyKey<OverflowWrapType> { .overflowWrap }
    public var propertyValue: OverflowWrapType
    var _content = _PropertyContent<OverflowWrapType>()
    
    public init (_ type: OverflowWrapType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<OverflowWrapType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, OverflowWrapType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether or not the browser may break lines within words
    /// in order to prevent overflow (when a string is too long to fit its containing box)
    public static var overflowWrap: PropertyKey<OverflowWrapType> { "overflow-wrap".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not the browser may break lines within words
    /// in order to prevent overflow (when a string is too long to fit its containing box)
    public typealias OverflowWrap = OverflowWrapProperty
}

extension CSSRulable {
    /// Specifies whether or not the browser may break lines within words
    /// in order to prevent overflow (when a string is too long to fit its containing box)
    public func overflowWrap(_ type: OverflowWrapType) -> Self {
        s?._addProperty(.overflowWrap, type)
        return self
    }

    /// Specifies whether or not the browser may break lines within words
    /// in order to prevent overflow (when a string is too long to fit its containing box)
    public func overflowWrap(_ type: State<OverflowWrapType>) -> Self {
        s?._addProperty(OverflowWrapProperty(type))
        return self
    }

    /// Specifies whether or not the browser may break lines within words
    /// in order to prevent overflow (when a string is too long to fit its containing box)
    public func overflowWrap<V>(_ type: ExpressableState<V, OverflowWrapType>) -> Self {
        overflowWrap(type.unwrap())
    }
}
