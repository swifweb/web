//
//  PaddingTopProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the top padding of an element
///
/// ```html
/// padding-top: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_padding-top.asp)
public class PaddingTopProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .paddingTop }
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
    /// Sets the top padding of an element
    public static var paddingTop: PropertyKey<UnitValue> { "padding-top".propertyKey() }
}

extension Stylesheet {
    /// Sets the top padding of an element
    public typealias PaddingTop = PaddingTopProperty
}

extension CSSRulable {
    /// Sets the top padding of an element
    public func paddingTop<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(PaddingTopProperty(value))
        return self
    }

    /// Sets the top padding of an element
    public func paddingTop<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        paddingTop(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the top padding of an element
    public func paddingTop(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top padding of an element
    public func paddingTop<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.paddingTop, UnitValue(value, unit))
        return self
    }
}
