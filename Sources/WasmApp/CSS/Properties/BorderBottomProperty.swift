//
//  BorderBottomProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for border-bottom-width, border-bottom-style and border-bottom-color
///
/// ```html
/// border-bottom: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom.asp)
public class BorderBottomProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderBottom }
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
    /// A shorthand property for border-bottom-width, border-bottom-style and border-bottom-color
    public static var borderBottom: PropertyKey<BorderValue> { "border-bottom".propertyKey() }
}

extension Stylesheet {
    /// A shorthand property for border-bottom-width, border-bottom-style and border-bottom-color
    public typealias BorderBottom = BorderBottomProperty
}

extension CSSRulable {
    /// A shorthand property for border-bottom-width, border-bottom-style and border-bottom-color
    public func borderBottom(_ type: BorderValue) -> Self {
        s?._addProperty(.borderBottom, type)
        return self
    }

    /// A shorthand property for border-bottom-width, border-bottom-style and border-bottom-color
    public func borderBottom(_ type: State<BorderValue>) -> Self {
        s?._addProperty(BorderBottomProperty(type))
        return self
    }

    /// A shorthand property for border-bottom-width, border-bottom-style and border-bottom-color
    public func borderBottom<V>(_ type: ExpressableState<V, BorderValue>) -> Self {
        borderBottom(type.unwrap())
    }
}
