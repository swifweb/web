//
//  OutlineStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of an outline
///
/// ```html
/// outline-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-style.asp)
public class OutlineStyleProperty: _Property {
    public var propertyKey: PropertyKey<OutlineStyleType> { .outlineStyle }
    public var propertyValue: OutlineStyleType
    var _content = _PropertyContent<OutlineStyleType>()
    
    public init (_ type: OutlineStyleType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<OutlineStyleType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, OutlineStyleType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the style of an outline
    public static var outlineStyle: PropertyKey<OutlineStyleType> { "outline-style".propertyKey() }
}

extension Stylesheet {
    /// Sets the style of an outline
    public typealias OutlineStyle = OutlineStyleProperty
}

extension CSSRulable {
    /// Sets the style of an outline
    public func outlineStyle(_ type: OutlineStyleType) -> Self {
        s?._addProperty(.outlineStyle, type)
        return self
    }

    /// Sets the style of an outline
    public func outlineStyle(_ type: State<OutlineStyleType>) -> Self {
        s?._addProperty(OutlineStyleProperty(type))
        return self
    }

    /// Sets the style of an outline
    public func outlineStyle<V>(_ type: ExpressableState<V, OutlineStyleType>) -> Self {
        outlineStyle(type.unwrap())
    }
}
