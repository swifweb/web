//
//  BorderTopProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for border-top-width, border-top-style and border-top-color
///
/// ```html
/// border-top: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top.asp)
public class BorderTopProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderTop }
    public var propertyValue: BorderValue
    var _content = _PropertyContent<BorderValue>()
    
    public init (width: BorderWidthType? = nil, style: BorderStyleType, color: Color? = nil) {
        propertyValue = BorderValue(width: width, style: style, color: color)
    }
    
    public convenience init <A>(width: A, style: BorderStyleType, color: Color? = nil) where A: StateConvertible, A.Value == Optional<BorderWidthType> {
        let width = width.stateValue
        self.init(width: width.wrappedValue, style: style, color: color)
        width.listen { self._changed(to: BorderValue(width: $0, style: style, color: color)) }
    }
    
    public convenience init <B>(width: BorderWidthType? = nil, style: B, color: Color? = nil) where B: StateConvertible, B.Value == BorderStyleType {
        let style = style.stateValue
        self.init(width: width, style: style.wrappedValue, color: color)
        style.listen { self._changed(to: BorderValue(width: width, style: $0, color: color)) }
    }
    
    public convenience init <C>(width: BorderWidthType? = nil, style: BorderStyleType, color: C) where C: StateConvertible, C.Value == Optional<Color> {
        let color = color.stateValue
        self.init(width: width, style: style, color: color.wrappedValue)
        color.listen { self._changed(to: BorderValue(width: width, style: style, color: $0)) }
    }
    
    public convenience init <A, B>(width: A, style: B, color: Color? = nil) where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType {
        let width = width.stateValue
        let style = style.stateValue
        self.init(width: width.wrappedValue, style: style.wrappedValue, color: color)
        width.listen { self._changed(to: BorderValue(width: $0, style: style.wrappedValue, color: color)) }
        style.listen { self._changed(to: BorderValue(width: width.wrappedValue, style: $0, color: color)) }
    }
    
    public convenience init <A, C>(width: A, style: BorderStyleType, color: C) where A: StateConvertible, A.Value == BorderWidthType, C: StateConvertible, C.Value == Optional<Color> {
        let width = width.stateValue
        let color = color.stateValue
        self.init(width: width.wrappedValue, style: style, color: color.wrappedValue)
        width.listen { self._changed(to: BorderValue(width: $0, style: style, color: color.wrappedValue)) }
        color.listen { self._changed(to: BorderValue(width: width.wrappedValue, style: style, color: $0)) }
    }
    
    public convenience init <B, C>(width: BorderWidthType, style: B, color: C) where B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Optional<Color> {
        let style = style.stateValue
        let color = color.stateValue
        self.init(width: width, style: style.wrappedValue, color: color.wrappedValue)
        style.listen { self._changed(to: BorderValue(width: width, style: $0, color: color.wrappedValue)) }
        color.listen { self._changed(to: BorderValue(width: width, style: style.wrappedValue, color: $0)) }
    }
    
    public convenience init <A, B, C>(width: A, style: B, color: C) where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Optional<Color> {
        let width = width.stateValue
        let style = style.stateValue
        let color = color.stateValue
        self.init(width: width.wrappedValue, style: style.wrappedValue, color: color.wrappedValue)
        width.listen { self._changed(to: BorderValue(width: $0, style: style.wrappedValue, color: color.wrappedValue)) }
        style.listen { self._changed(to: BorderValue(width: width.wrappedValue, style: $0, color: color.wrappedValue)) }
        color.listen { self._changed(to: BorderValue(width: width.wrappedValue, style: style.wrappedValue, color: $0)) }
    }
}

extension PropertyKey {
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public static var borderTop: PropertyKey<BorderValue> { "border-top".propertyKey() }
}

extension Stylesheet {
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public typealias BorderTop = BorderTopProperty
}

extension CSSRulable {
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop(width: BorderWidthType? = nil, style: BorderStyleType, color: Color? = nil) -> Self {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop(width: BorderWidthType? = nil, style: BorderStyleType, color: Int) -> Self {
        borderTop(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A>(width: A, style: BorderStyleType, color: Color? = nil) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A>(width: A, style: BorderStyleType, color: Int) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType> {
        borderTop(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<B>(width: BorderWidthType? = nil, style: B, color: Color? = nil) -> Self where B: StateConvertible, B.Value == BorderStyleType {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<B>(width: BorderWidthType? = nil, style: B, color: Int) -> Self where B: StateConvertible, B.Value == BorderStyleType {
        borderTop(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<C>(width: BorderWidthType? = nil, style: BorderStyleType, color: C) -> Self where C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<C>(width: BorderWidthType? = nil, style: BorderStyleType, color: C) -> Self where C: StateConvertible, C.Value == Int {
        borderTop(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A, B>(width: A, style: B, color: Color? = nil) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A, B>(width: A, style: B, color: Int) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType {
        borderTop(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A, C>(width: A, style: BorderStyleType, color: C) -> Self where A: StateConvertible, A.Value == BorderWidthType, C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A, C>(width: A, style: BorderStyleType, color: C) -> Self where A: StateConvertible, A.Value == BorderWidthType, C: StateConvertible, C.Value == Int {
        borderTop(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<B, C>(width: BorderWidthType, style: B, color: C) -> Self where B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<B, C>(width: BorderWidthType, style: B, color: C) -> Self where B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Int {
        borderTop(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A, B, C>(width: A, style: B, color: C) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for border-top-width, border-top-style and border-top-color
    public func borderTop<A, B, C>(width: A, style: B, color: C) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Int {
        borderTop(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
}