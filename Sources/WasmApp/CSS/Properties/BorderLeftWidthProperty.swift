//
//  BorderLeftWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the left border
///
/// ```html
/// border-left-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_width.asp)
public class BorderLeftWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderLeftWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BorderWidthType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderWidthType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the width of the left border
    public static var borderLeftWidth: PropertyKey<BorderWidthType> { "border-left-width".propertyKey() }
}

extension Stylesheet {
    /// Sets the width of the left border
    public typealias BorderLeftWidth = BorderLeftWidthProperty
}

extension CSSRulable {
    /// Sets the width of the left border
    public func borderLeftWidth(_ type: BorderWidthType) -> Self {
        s?._addProperty(.borderLeftWidth, type)
        return self
    }

    /// Sets the width of the left border
    public func borderLeftWidth(_ type: State<BorderWidthType>) -> Self {
        s?._addProperty(BorderLeftWidthProperty(type))
        return self
    }

    /// Sets the width of the left border
    public func borderLeftWidth<V>(_ type: ExpressableState<V, BorderWidthType>) -> Self {
        borderLeftWidth(type.unwrap())
    }
    
    /// Sets the width of the left border
    public func borderLeftWidth<L: UnitValuable>(_ length: L) -> Self {
        borderLeftWidth(.length(length))
    }
    
    /// Sets the width of the left border
    public func borderLeftWidth<L: UnitValuable>(_ type: State<L>) -> Self {
        borderLeftWidth(type.map { .length($0) })
    }

    /// Sets the width of the left border
    public func borderLeftWidth<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        borderLeftWidth(type.unwrap())
    }
}
