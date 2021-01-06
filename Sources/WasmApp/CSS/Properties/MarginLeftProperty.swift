//
//  MarginLeftProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the left margin of an element
///
/// ```html
/// margin-left: 30px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-left.asp)
public class MarginLeftProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginLeft }
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
    public static var marginLeft: PropertyKey<UnitValue> { "margin-left".propertyKey() }
}

extension Stylesheet {
    /// Sets the left margin of an element
    public typealias MarginLeft = MarginLeftProperty
}

extension CSSRulable {
    /// Sets the left margin of an element
    public func marginLeft<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MarginLeftProperty(value))
        return self
    }

    /// Sets the left margin of an element
    public func marginLeft<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        marginLeft(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the left margin of an element
    public func marginLeft(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
    
    /// Sets the left margin of an element
    public func marginLeft<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.marginLeft, UnitValue(value, unit))
        return self
    }
}
