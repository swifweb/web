//
//  MarginTopProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the top margin of an element
///
/// ```html
/// margin-top: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-top.asp)
public class MarginTopProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginTop }
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
    /// Sets the top margin of an element
    public static var marginTop: PropertyKey<UnitValue> { "margin-top".propertyKey() }
}

extension Stylesheet {
    /// Sets the top margin of an element
    public typealias MarginTop = MarginTopProperty
}

extension CSSRulable {
    /// Sets the top margin of an element
    public func marginTop<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.marginTop, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MarginTopProperty(value))
        return self
    }

    /// Sets the top margin of an element
    public func marginTop<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        marginTop(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the top margin of an element
    public func marginTop(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginTop<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.marginTop, UnitValue(value, unit))
        return self
    }
}
