//
//  BorderTopWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the top border
///
/// ```html
/// border-top-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_width.asp)
public class BorderTopWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderTopWidth }
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
    /// Sets the width of the top border
    public static var borderTopWidth: PropertyKey<BorderWidthType> { "border-top-width".propertyKey() }
}

extension Stylesheet {
    /// Sets the width of the top border
    public typealias BorderTopWidth = BorderTopWidthProperty
}

extension CSSRulable {
    /// Sets the width of the top border
    public func borderTopWidth(_ type: BorderWidthType) -> Self {
        s?._addProperty(.borderTopWidth, type)
        return self
    }

    /// Sets the width of the top border
    public func borderTopWidth(_ type: State<BorderWidthType>) -> Self {
        s?._addProperty(BorderTopWidthProperty(type))
        return self
    }

    /// Sets the width of the top border
    public func borderTopWidth<V>(_ type: ExpressableState<V, BorderWidthType>) -> Self {
        borderTopWidth(type.unwrap())
    }
    
    /// Sets the width of the top border
    public func borderTopWidth<L: UnitValuable>(_ length: L) -> Self {
        borderTopWidth(.length(length))
    }
    
    /// Sets the width of the top border
    public func borderTopWidth<L: UnitValuable>(_ type: State<L>) -> Self {
        borderTopWidth(type.map { .length($0) })
    }

    /// Sets the width of the top border
    public func borderTopWidth<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        borderTopWidth(type.unwrap())
    }
}
