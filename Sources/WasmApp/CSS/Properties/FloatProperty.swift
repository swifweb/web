//
//  Float.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a box should float
///
/// ```html
/// float: right;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_float.asp)
public class FloatProperty: _Property {
    public var propertyKey: PropertyKey<FloatType> { .float }
    public var propertyValue: FloatType
    var _content = _PropertyContent<FloatType>()
    
    public init (_ type: FloatType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FloatType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FloatType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether or not a box should float
    public static var float: PropertyKey<FloatType> { "float".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not a box should float
    public typealias Float = FloatProperty
}

extension CSSRulable {
    /// Specifies whether or not a box should float
    public func float(_ type: FloatType) -> Self {
        s?._addProperty(.float, type)
        return self
    }

    /// Specifies whether or not a box should float
    public func float(_ type: State<FloatType>) -> Self {
        s?._addProperty(FloatProperty(type))
        return self
    }

    /// Specifies whether or not a box should float
    public func float<V>(_ type: ExpressableState<V, FloatType>) -> Self {
        float(type.unwrap())
    }
}
