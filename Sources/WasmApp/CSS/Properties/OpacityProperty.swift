//
//  Opacity.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the opacity level for an element
///
/// ```html
/// opacity: 0.5
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_opacity.asp)
public class OpacityProperty: _Property {
    public var propertyKey: PropertyKey<NumericValueContainer> { .opacity }
    public var propertyValue: NumericValueContainer
    var _content = _PropertyContent<NumericValueContainer>()
    
    public init (_ v: NumericValue) {
        propertyValue = NumericValueContainer(v)
    }
    
    public convenience init (_ type: State<NumericValue>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: NumericValueContainer($0)) }
    }

    public convenience init <V>(_ type: ExpressableState<V, NumericValue>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the opacity level for an element
    public static var opacity: PropertyKey<NumericValueContainer> { "opacity".propertyKey() }
}

extension Stylesheet {
    /// Sets the opacity level for an element
    public typealias Opacity = OpacityProperty
}

extension CSSRulable {
    /// Sets the opacity level for an element
    public func opacity(_ value: NumericValue) -> Self {
        s?._addProperty(.opacity, NumericValueContainer(value))
        return self
    }

    /// Sets the opacity level for an element
    public func opacity(_ value: State<NumericValue>) -> Self {
        s?._addProperty(OpacityProperty(value))
        return self
    }

    /// Sets the opacity level for an element
    public func opacity<V>(_ value: ExpressableState<V, NumericValue>) -> Self {
        opacity(value.unwrap())
    }
}
