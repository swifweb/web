//
//  MarginRightProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the right margin of an element
///
/// ```html
/// margin-right: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-right.asp)
public class MarginRightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginRight }
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
    public static var marginRight: PropertyKey<UnitValue> { "margin-right".propertyKey() }
}

extension Stylesheet {
    /// Sets the right margin of an element
    public typealias MarginRight = MarginRightProperty
}

extension CSSRulable {
    /// Sets the right margin of an element
    public func marginRight<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.marginRight, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MarginRightProperty(value))
        return self
    }

    /// Sets the top margin of an element
    public func marginRight<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        marginRight(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the top margin of an element
    public func marginRight(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginRight<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.marginRight, UnitValue(value, unit))
        return self
    }
}
