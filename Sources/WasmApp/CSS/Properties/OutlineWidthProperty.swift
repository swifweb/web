//
//  OutlineWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of an outline
///
/// ```html
/// outline-width: thick;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-width.asp)
public class OutlineWidthProperty: _Property {
    public var propertyKey: PropertyKey<OutlineWidthType> { .outlineWidth }
    public var propertyValue: OutlineWidthType
    var _content = _PropertyContent<OutlineWidthType>()
    
    public init (_ type: OutlineWidthType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<OutlineWidthType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, OutlineWidthType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the width of an outline
    public static var outlineWidth: PropertyKey<OutlineWidthType> { "outline-width".propertyKey() }
}

extension Stylesheet {
    /// Sets the width of an outline
    public typealias OutlineWidth = OutlineWidthProperty
}

extension CSSRulable {
    /// Sets the width of an outline
    public func outlineWidth(_ type: OutlineWidthType) -> Self {
        s?._addProperty(.outlineWidth, type)
        return self
    }

    /// Sets the width of an outline
    public func outlineWidth(_ type: State<OutlineWidthType>) -> Self {
        s?._addProperty(OutlineWidthProperty(type))
        return self
    }

    /// Sets the width of an outline
    public func outlineWidth<V>(_ type: ExpressableState<V, OutlineWidthType>) -> Self {
        outlineWidth(type.unwrap())
    }
    
    /// Sets the width of an outline
    public func outlineWidth<U: UnitValuable>(_ type: U) -> Self {
        outlineWidth(.length(type))
    }

    /// Sets the width of an outline
    public func outlineWidth<U: UnitValuable>(_ type: State<U>) -> Self {
        outlineWidth(type.map { .length($0) })
    }

    /// Sets the width of an outline
    public func outlineWidth<V, U: UnitValuable>(_ type: ExpressableState<V, U>) -> Self {
        outlineWidth(type.unwrap())
    }
}
