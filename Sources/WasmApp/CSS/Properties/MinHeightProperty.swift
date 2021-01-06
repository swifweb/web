//
//  MinHeightProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 07.01.2021.
//

/// Sets the minimum height of an element
///
/// ```html
/// min-height: 200px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_min-height.asp)
public class MinHeightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .minHeight }
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
    /// Sets the minimum height of an element
    public static var minHeight: PropertyKey<UnitValue> { "min-height".propertyKey() }
}

extension Stylesheet {
    /// Sets the minimum height of an element
    public typealias MinHeight = MinHeightProperty
}

extension CSSRulable {
    /// Sets the minimum height of an element
    public func minHeight<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.minHeight, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MinHeightProperty(value))
        return self
    }

    /// Sets the minimum height of an element
    public func minHeight<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        minHeight(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the minimum height of an element
    public func minHeight(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum height of an element
    public func minHeight<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.minHeight, UnitValue(value, unit))
        return self
    }
}
