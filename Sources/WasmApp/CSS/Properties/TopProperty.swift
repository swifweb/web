//
//  Top.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the top position of a positioned element
///
/// ```html
/// div {
///     position: absolute;
///     top: 50px;
///     border: 3px solid green;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_top.asp)
public class TopProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .top }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ value: U) {
        propertyValue = UnitValue(value.value.doubleValue, value.unit)
    }
    
    public convenience init <U: UnitValuable>(_ value: State<U>) {
        self.init(value.wrappedValue)
        value.listen { self._changed(to: UnitValue($0.value.doubleValue, $0.unit)) }
    }

    public convenience init <V, U: UnitValuable>(_ value: ExpressableState<V, U>) {
        self.init(value.unwrap())
    }
    
    // MARK: Extended
    
    public convenience init (_ value: Double, _ unit: Unit) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init (_ value: State<Double>, _ unit: Unit) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init (_ value: Double, _ unit: State<Unit>) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init <V>(_ value: ExpressableState<V, Double>, _ unit: Unit) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init <V>(_ value: Double, _ unit: ExpressableState<V, Unit>) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init <V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init <V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init (_ value: State<Double>, _ unit: State<Unit>) {
        self.init(UnitValue(value, unit))
    }
    
    public convenience init <V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) {
        self.init(UnitValue(value, unit))
    }
}

extension PropertyKey {
    /// Specifies the top position of a positioned element
    public static var top: PropertyKey<UnitValue> { "top".propertyKey() }
}

extension Stylesheet {
    /// Specifies the top position of a positioned element
    public typealias Top = TopProperty
}

extension CSSRulable {
    /// Specifies the top position of a positioned element
    public func top<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.top, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(TopProperty(value))
        return self
    }

    /// Specifies the top position of a positioned element
    public func top<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        top(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the top position of a positioned element
    public func top(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the top position of a positioned element
    public func top<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.top, UnitValue(value, unit))
        return self
    }
}
