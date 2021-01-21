//
//  BorderBottomWidthProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the bottom border
///
/// ```html
/// border-bottom-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_width.asp)
public class BorderBottomWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderBottomWidth }
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
    /// Sets the width of the bottom border
    public static var borderBottomWidth: PropertyKey<BorderWidthType> { "border-bottom-width".propertyKey() }
}

extension Stylesheet {
    /// Sets the width of the bottom border
    public typealias BorderBottomWidth = BorderBottomWidthProperty
}

extension CSSRulable {
    /// Sets the width of the bottom border
    public func borderBottomWidth(_ type: BorderWidthType) -> Self {
        s?._addProperty(.borderBottomWidth, type)
        return self
    }

    /// Sets the width of the bottom border
    public func borderBottomWidth(_ type: State<BorderWidthType>) -> Self {
        s?._addProperty(BorderBottomWidthProperty(type))
        return self
    }

    /// Sets the width of the bottom border
    public func borderBottomWidth<V>(_ type: ExpressableState<V, BorderWidthType>) -> Self {
        borderBottomWidth(type.unwrap())
    }
    
    /// Sets the width of the bottom border
    public func borderBottomWidth<L: UnitValuable>(_ length: L) -> Self {
        borderBottomWidth(.length(length))
    }
    
    /// Sets the width of the bottom border
    public func borderBottomWidth<L: UnitValuable>(_ type: State<L>) -> Self {
        borderBottomWidth(type.map { .length($0) })
    }

    /// Sets the width of the bottom border
    public func borderBottomWidth<V, L: UnitValuable>(_ type: ExpressableState<V, L>) -> Self {
        borderBottomWidth(type.unwrap())
    }
}
