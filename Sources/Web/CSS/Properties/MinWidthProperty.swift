//
//  MinWidthProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the minimum width of an element
///
/// ```html
/// min-width: 500px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_min-width.asp)
public class MinWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .minWidth }
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
    /// Sets the minimum width of an element
    public static var minWidth: PropertyKey<UnitValue> { "min-width".propertyKey() }
}

extension Stylesheet {
    /// Sets the minimum width of an element
    public typealias MinWidth = MinWidthProperty
}

extension CSSRulable {
    /// Sets the minimum width of an element
    public func minWidth<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.minWidth, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MinWidthProperty(value))
        return self
    }

    /// Sets the minimum width of an element
    public func minWidth<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        minWidth(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the minimum width of an element
    public func minWidth(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the minimum width of an element
    public func minWidth<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.minWidth, UnitValue(value, unit))
        return self
    }
}
