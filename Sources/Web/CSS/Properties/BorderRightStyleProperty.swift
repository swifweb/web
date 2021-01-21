//
//  BorderRightStyleProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of the right border
///
/// ```html
/// border-right-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_style.asp)
public class BorderRightStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderRightStyle }
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
    /// Sets the style of the right border
    public static var borderRightStyle: PropertyKey<BorderStyleType> { "border-right-style".propertyKey() }
}

extension Stylesheet {
    /// Sets the style of the right border
    public typealias BorderRightStyle = BorderRightStyleProperty
}

extension CSSRulable {
    /// Sets the style of the right border
    public func borderRightStyle(_ type: BorderStyleType) -> Self {
        s?._addProperty(.borderRightStyle, type)
        return self
    }

    /// Sets the style of the right border
    public func borderRightStyle(_ type: State<BorderStyleType>) -> Self {
        s?._addProperty(BorderRightStyleProperty(type))
        return self
    }

    /// Sets the style of the right border
    public func borderRightStyle<V>(_ type: ExpressableState<V, BorderStyleType>) -> Self {
        borderRightStyle(type.unwrap())
    }
}
