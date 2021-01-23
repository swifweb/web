//
//  BorderRightProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for all the border-right-* properties
///
/// ```html
/// border-right: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right.asp)
public class BorderRightProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderRight }
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
    /// A shorthand property for all the border-right-* properties
    public static var borderRight: PropertyKey<BorderValue> { "border-right".propertyKey() }
}

extension Stylesheet {
    /// A shorthand property for all the border-right-* properties
    public typealias BorderRight = BorderRightProperty
}

extension CSSRulable {
    /// A shorthand property for all the border-right-* properties
    public func borderRight(width: BorderWidthType? = nil, style: BorderStyleType, color: Color? = nil) -> Self {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight(width: BorderWidthType? = nil, style: BorderStyleType, color: Int) -> Self {
        borderRight(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A>(width: A, style: BorderStyleType, color: Color? = nil) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A>(width: A, style: BorderStyleType, color: Int) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType> {
        borderRight(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<B>(width: BorderWidthType? = nil, style: B, color: Color? = nil) -> Self where B: StateConvertible, B.Value == BorderStyleType {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<B>(width: BorderWidthType? = nil, style: B, color: Int) -> Self where B: StateConvertible, B.Value == BorderStyleType {
        borderRight(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<C>(width: BorderWidthType? = nil, style: BorderStyleType, color: C) -> Self where C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<C>(width: BorderWidthType? = nil, style: BorderStyleType, color: C) -> Self where C: StateConvertible, C.Value == Int {
        borderRight(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A, B>(width: A, style: B, color: Color? = nil) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A, B>(width: A, style: B, color: Int) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType {
        borderRight(width: width, style: style, color: .hex(color))
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A, C>(width: A, style: BorderStyleType, color: C) -> Self where A: StateConvertible, A.Value == BorderWidthType, C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A, C>(width: A, style: BorderStyleType, color: C) -> Self where A: StateConvertible, A.Value == BorderWidthType, C: StateConvertible, C.Value == Int {
        borderRight(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<B, C>(width: BorderWidthType, style: B, color: C) -> Self where B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<B, C>(width: BorderWidthType, style: B, color: C) -> Self where B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Int {
        borderRight(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A, B, C>(width: A, style: B, color: C) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Optional<Color> {
        s?._addProperty(BorderTopProperty(width: width, style: style, color: color))
        return self
    }
    
    /// A shorthand property for all the border-right-* properties
    public func borderRight<A, B, C>(width: A, style: B, color: C) -> Self where A: StateConvertible, A.Value == Optional<BorderWidthType>, B: StateConvertible, B.Value == BorderStyleType, C: StateConvertible, C.Value == Int {
        borderRight(width: width, style: style, color: color.stateValue.map { .hex($0) })
    }
}