//
//  MarginBottomProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the bottom margin of an element
///
/// ```html
/// margin-bottom: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin-bottom.asp)
public class MarginBottomProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .marginBottom }
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
    public static var marginBottom: PropertyKey<UnitValue> { "margin-bottom".propertyKey() }
}

extension Stylesheet {
    /// Sets the bottom margin of an element
    public typealias MarginBottom = MarginBottomProperty
}

extension CSSRulable {
    /// Sets the bottom margin of an element
    public func marginBottom<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MarginBottomProperty(value))
        return self
    }

    /// Sets the bottom margin of an element
    public func marginBottom<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        marginBottom(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the bottom margin of an element
    public func marginBottom(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom margin of an element
    public func marginBottom(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the top margin of an element
    public func marginBottom<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.marginBottom, UnitValue(value, unit))
        return self
    }
}
