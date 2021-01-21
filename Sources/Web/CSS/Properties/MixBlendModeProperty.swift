//
//  MixBlendMode.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies how an element's content should blend with its direct parent background
///
/// ```html
/// .container {
///     background-color: red;
/// }
///
/// .container img {
///     mix-blend-mode: darken;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_mix-blend-mode.asp)
public class MixBlendModeProperty: _Property {
    public var propertyKey: PropertyKey<MixBlendModeType> { .mixBlendMode }
    public var propertyValue: MixBlendModeType
    var _content = _PropertyContent<MixBlendModeType>()
    
    public init (_ type: MixBlendModeType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<MixBlendModeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, MixBlendModeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how an element's content should blend with its direct parent background
    public static var mixBlendMode: PropertyKey<MixBlendModeType> { "mix-blend-mode".propertyKey() }
}

extension Stylesheet {
    /// Specifies how an element's content should blend with its direct parent background
    public typealias MixBlendMode = MixBlendModeProperty
}

extension CSSRulable {
    /// Specifies how an element's content should blend with its direct parent background
    public func mixBlendMode(_ type: MixBlendModeType) -> Self {
        s?._addProperty(.mixBlendMode, type)
        return self
    }

    /// Specifies how an element's content should blend with its direct parent background
    public func mixBlendMode(_ type: State<MixBlendModeType>) -> Self {
        s?._addProperty(MixBlendModeProperty(type))
        return self
    }

    /// Specifies how an element's content should blend with its direct parent background
    public func mixBlendMode<V>(_ type: ExpressableState<V, MixBlendModeType>) -> Self {
        mixBlendMode(type.unwrap())
    }
}
