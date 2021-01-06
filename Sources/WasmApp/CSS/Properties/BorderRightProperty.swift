//
//  BorderRightProperty.swift
//  WasmApp
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
    /// A shorthand property for all the border-right-* properties
    public static var borderRight: PropertyKey<BorderValue> { "border-right".propertyKey() }
}

extension Stylesheet {
    /// A shorthand property for all the border-right-* properties
    public typealias BorderRight = BorderRightProperty
}

extension CSSRulable {
    /// A shorthand property for all the border-right-* properties
    public func borderRight(_ type: BorderValue) -> Self {
        s?._addProperty(.borderRight, type)
        return self
    }

    /// A shorthand property for all the border-right-* properties
    public func borderRight(_ type: State<BorderValue>) -> Self {
        s?._addProperty(BorderRightProperty(type))
        return self
    }

    /// A shorthand property for all the border-right-* properties
    public func borderRight<V>(_ type: ExpressableState<V, BorderValue>) -> Self {
        borderRight(type.unwrap())
    }
}
