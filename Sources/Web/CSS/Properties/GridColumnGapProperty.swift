//
//  GridColumnGapProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the size of the gap between columns
///
/// ```html
/// grid-column-gap: 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_grid-column-gap.asp)
public class GridColumnGapProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .gridColumnGap }
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
    /// Specifies the size of the gap between columns
    public static var gridColumnGap: PropertyKey<UnitValue> { "grid-column-gap".propertyKey() }
}

extension Stylesheet {
    /// Specifies the size of the gap between columns
    public typealias GridColumnGap = GridColumnGapProperty
}

extension CSSRulable {
    /// Specifies the size of the gap between columns
    public func gridColumnGap<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(GridColumnGapProperty(value))
        return self
    }

    /// Specifies the size of the gap between columns
    public func gridColumnGap<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        gridColumnGap(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the size of the gap between columns
    public func gridColumnGap<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.gridColumnGap, UnitValue(value, unit))
        return self
    }
}
