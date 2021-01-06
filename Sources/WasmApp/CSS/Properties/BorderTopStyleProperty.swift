//
//  BorderTopStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the top border
///
/// ```html
/// border-top-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_style.asp)
public class BorderTopStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderTopStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BorderStyleType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderStyleType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the style of the top border
    public static var borderTopStyle: PropertyKey<BorderStyleType> { "border-top-style".propertyKey() }
}

extension Stylesheet {
    /// Sets the style of the top border
    public typealias BorderTopStyle = BorderTopStyleProperty
}

extension CSSRulable {
    /// Sets the style of the top border
    public func borderTopStyle(_ type: BorderStyleType) -> Self {
        s?._addProperty(.borderTopStyle, type)
        return self
    }

    /// Sets the style of the top border
    public func borderTopStyle(_ type: State<BorderStyleType>) -> Self {
        s?._addProperty(BorderTopStyleProperty(type))
        return self
    }

    /// Sets the style of the top border
    public func borderTopStyle<V>(_ type: ExpressableState<V, BorderStyleType>) -> Self {
        borderTopStyle(type.unwrap())
    }
}
