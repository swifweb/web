//
//  ColumnGap.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the gap between the columns
///
/// ```html
/// column-gap: 40px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-gap.asp)
public class ColumnGapProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .columnGap }
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
    /// Specifies the gap between the columns
    public static var columnGap: PropertyKey<UnitValue> { "column-gap".propertyKey() }
}

extension Stylesheet {
    /// Specifies the gap between the columns
    public typealias ColumnGap = ColumnGapProperty
}

extension CSSRulable {
    /// Specifies the gap between the columns
    public func columnGap<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.columnGap, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(ColumnGapProperty(value))
        return self
    }

    /// Specifies the gap between the columns
    public func columnGap<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        columnGap(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the gap between the columns
    public func columnGap(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the gap between the columns
    public func columnGap<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.columnGap, UnitValue(value, unit))
        return self
    }
}
