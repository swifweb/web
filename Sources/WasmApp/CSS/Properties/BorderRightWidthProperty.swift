//
//  BorderRightWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of the right border
///
/// ```html
/// border-right-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_width.asp)
public class BorderRightWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderRightWidth }
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
    /// Sets the width of the right border
    public static var borderRightWidth: PropertyKey<BorderWidthType> { "border-right-width".propertyKey() }
}

extension Stylesheet {
    /// Sets the width of the right border
    public typealias BorderRightWidth = BorderRightWidthProperty
}

extension CSSRulable {
    /// Sets the width of the right border
    public func borderRightWidth(_ type: BorderWidthType) -> Self {
        s?._addProperty(.borderRightWidth, type)
        return self
    }

    /// Sets the width of the right border
    public func borderRightWidth(_ type: State<BorderWidthType>) -> Self {
        s?._addProperty(BorderRightWidthProperty(type))
        return self
    }

    /// Sets the width of the right border
    public func borderRightWidth<V>(_ type: ExpressableState<V, BorderWidthType>) -> Self {
        borderRightWidth(type.unwrap())
    }
}
