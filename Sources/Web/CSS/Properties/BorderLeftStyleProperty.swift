//
//  BorderLeftStyleProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the left border
///
/// ```html
/// border-left-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_style.asp)
public class BorderLeftStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderLeftStyle }
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
    /// Sets the style of the left border
    public static var borderLeftStyle: PropertyKey<BorderStyleType> { "border-left-style".propertyKey() }
}

extension Stylesheet {
    /// Sets the style of the left border
    public typealias BorderLeftStyle = BorderLeftStyleProperty
}

extension CSSRulable {
    /// Sets the style of the left border
    public func borderLeftStyle(_ type: BorderStyleType) -> Self {
        s?._addProperty(.borderLeftStyle, type)
        return self
    }

    /// Sets the style of the left border
    public func borderLeftStyle(_ type: State<BorderStyleType>) -> Self {
        s?._addProperty(BorderLeftStyleProperty(type))
        return self
    }

    /// Sets the style of the left border
    public func borderLeftStyle<V>(_ type: ExpressableState<V, BorderStyleType>) -> Self {
        borderLeftStyle(type.unwrap())
    }
}
