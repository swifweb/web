//
//  GridRowGapProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the size of the gap between rows
///
/// ```html
/// grid-row-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-row-gap.asp)
public class GridRowGapProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .gridRowGap }
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
    /// Specifies the size of the gap between rows
    public static var gridRowGap: PropertyKey<UnitValue> { "grid-row-gap".propertyKey() }
}

extension Stylesheet {
    /// Specifies the size of the gap between rows
    public typealias GridRowGap = GridRowGapProperty
}

extension CSSRulable {
    /// Specifies the size of the gap between rows
    public func gridRowGap<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(GridRowGapProperty(value))
        return self
    }

    /// Specifies the size of the gap between rows
    public func gridRowGap<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        gridRowGap(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the size of the gap between rows
    public func gridRowGap(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between rows
    public func gridRowGap<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.gridRowGap, UnitValue(value, unit))
        return self
    }
}
