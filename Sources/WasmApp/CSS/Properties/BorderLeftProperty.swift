//
//  BorderLeftProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for all the border-left-* properties
///
/// ```html
/// border-left: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left.asp)
public class BorderLeftProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderLeft }
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
    /// A shorthand property for all the border-left-* properties
    public static var borderLeft: PropertyKey<BorderValue> { "border-left".propertyKey() }
}

extension Stylesheet {
    /// A shorthand property for all the border-left-* properties
    public typealias BorderLeft = BorderLeftProperty
}

extension CSSRulable {
    /// A shorthand property for all the border-left-* properties
    public func borderLeft(_ type: BorderValue) -> Self {
        s?._addProperty(.borderLeft, type)
        return self
    }

    /// A shorthand property for all the border-left-* properties
    public func borderLeft(_ type: State<BorderValue>) -> Self {
        s?._addProperty(BorderLeftProperty(type))
        return self
    }

    /// A shorthand property for all the border-left-* properties
    public func borderLeft<V>(_ type: ExpressableState<V, BorderValue>) -> Self {
        borderLeft(type.unwrap())
    }
}
