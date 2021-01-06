//
//  Border.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for border-width, border-style and border-color
///
/// ```html
/// border: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border.asp)
public class BorderProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .border }
    public var propertyValue: BorderValue
    var _content = _PropertyContent<BorderValue>()
    
    public init (_ value: BorderValue) {
        propertyValue = value
    }
    
    public convenience init (_ type: State<BorderValue>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BorderValue>) {
        self.init(type.unwrap())
    }
    
    public init (width: BorderWidthType? = nil, style: BorderStyleType, color: ColorType? = nil) {
        propertyValue = BorderValue(width: width, style: style, color: color)
    }
}

extension PropertyKey {
    /// A shorthand property for border-width, border-style and border-color
    public static var border: PropertyKey<BorderValue> { "border".propertyKey() }
}

public struct BorderValue: CustomStringConvertible {
    public let value: String
    
    public init (width: BorderWidthType? = nil, style: BorderStyleType, color: ColorType? = nil) {
        value = [width?.value, style.value, color?.description].compactMap { $0 }.joined(separator: " ")
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for border-width, border-style and border-color
    public typealias Border = BorderProperty
}

extension CSSRulable {
    /// A shorthand property for border-width, border-style and border-color
    public func border(_ type: BorderValue) -> Self {
        s?._addProperty(.border, type)
        return self
    }

    /// A shorthand property for border-width, border-style and border-color
    public func border(_ type: State<BorderValue>) -> Self {
        s?._addProperty(BorderProperty(type))
        return self
    }

    /// A shorthand property for border-width, border-style and border-color
    public func border<V>(_ type: ExpressableState<V, BorderValue>) -> Self {
        border(type.unwrap())
    }
}
