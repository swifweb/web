//
//  VerticalAlign.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the vertical alignment of an element
///
/// ```html
/// img.a {
///     vertical-align: baseline;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_vertical-align.asp)
public class VerticalAlignProperty: _Property {
    public var propertyKey: PropertyKey<VerticalAlignType> { .verticalAlign }
    public var propertyValue: VerticalAlignType
    var _content = _PropertyContent<VerticalAlignType>()
    
    public init (_ type: VerticalAlignType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<VerticalAlignType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, VerticalAlignType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the vertical alignment of an element
    public static var verticalAlign: PropertyKey<VerticalAlignType> { "vertical-align".propertyKey() }
}

extension Stylesheet {
    /// Sets the vertical alignment of an element
    public typealias VerticalAlign = VerticalAlignProperty
}

extension CSSRulable {
    /// Sets the vertical alignment of an element
    public func verticalAlign(_ type: VerticalAlignType) -> Self {
        s?._addProperty(.verticalAlign, type)
        return self
    }

    /// Sets the vertical alignment of an element
    public func verticalAlign(_ type: State<VerticalAlignType>) -> Self {
        s?._addProperty(VerticalAlignProperty(type))
        return self
    }

    /// Sets the vertical alignment of an element
    public func verticalAlign<V>(_ type: ExpressableState<V, VerticalAlignType>) -> Self {
        verticalAlign(type.unwrap())
    }
    
    /// Sets the vertical alignment of an element
    public func verticalAlign<U: UnitValuable>(_ type: U) -> Self {
        verticalAlign(.length(type))
    }

    /// Sets the vertical alignment of an element
    public func verticalAlign<U: UnitValuable>(_ type: State<U>) -> Self {
        verticalAlign(type.map { .length($0) })
    }

    /// Sets the vertical alignment of an element
    public func verticalAlign<V, U: UnitValuable>(_ type: ExpressableState<V, U>) -> Self {
        verticalAlign(type.unwrap())
    }
}
