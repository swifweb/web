//
//  BorderBottomStyleProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the bottom border
///
/// ```html
/// border-bottom-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_style.asp)
public class BorderBottomStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderBottomStyle }
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
    /// Sets the style of the bottom border
    public static var borderBottomStyle: PropertyKey<BorderStyleType> { "border-bottom-style".propertyKey() }
}

extension Stylesheet {
    /// Sets the style of the bottom border
    public typealias BorderBottomStyle = BorderBottomStyleProperty
}

extension CSSRulable {
    /// Sets the style of the bottom border
    public func borderBottomStyle(_ type: BorderStyleType) -> Self {
        s?._addProperty(.borderBottomStyle, type)
        return self
    }

    /// Sets the style of the bottom border
    public func borderBottomStyle(_ type: State<BorderStyleType>) -> Self {
        s?._addProperty(BorderBottomStyleProperty(type))
        return self
    }

    /// Sets the style of the bottom border
    public func borderBottomStyle<V>(_ type: ExpressableState<V, BorderStyleType>) -> Self {
        borderBottomStyle(type.unwrap())
    }
}
