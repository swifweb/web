//
//  MaxHeightProperty.swift
//  Web
//
//  Created by Mihael Isaev on 07.01.2021.
//

/// Sets the maximum height of an element
///
/// ```html
/// max-height: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_max-height.asp)
public class MaxHeightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .maxHeight }
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
    public static var maxHeight: PropertyKey<UnitValue> { "max-height".propertyKey() }
}

extension Stylesheet {
    /// Sets the maximum height of an element
    public typealias MaxHeight = MaxHeightProperty
}

extension CSSRulable {
    /// Sets the maximum height of an element
    public func maxHeight<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MaxHeightProperty(value))
        return self
    }

    /// Sets the maximum height of an element
    public func maxHeight<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        maxHeight(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the maximum height of an element
    public func maxHeight(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum height of an element
    public func maxHeight<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.maxHeight, UnitValue(value, unit))
        return self
    }
}
