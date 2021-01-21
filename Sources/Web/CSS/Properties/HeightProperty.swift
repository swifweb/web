//
//  Height.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the height of an element
///
/// ```html
/// height: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_height.asp)
public class HeightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .height }
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
    /// Sets the height of an element
    public static var height: PropertyKey<UnitValue> { "height".propertyKey() }
}

extension Stylesheet {
    /// Sets the height of an element
    public typealias Height = HeightProperty
}

extension CSSRulable {
    /// Sets the height of an element
    public func height<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.height, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the height of an element
    public func height<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(HeightProperty(value))
        return self
    }

    /// Sets the height of an element
    public func height<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        height(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the height of an element
    public func height(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
    
    /// Sets the height of an element
    public func height<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.height, UnitValue(value, unit))
        return self
    }
}
