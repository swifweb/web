//
//  ColumnWidth.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the column width
///
/// ```html
/// column-width: 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-width.asp)
public class ColumnWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .columnWidth }
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
    /// Specifies the column width
    public static var columnWidth: PropertyKey<UnitValue> { "column-width".propertyKey() }
}

extension Stylesheet {
    /// Specifies the column width
    public typealias ColumnWidth = ColumnWidthProperty
}

extension CSSRulable {
    /// Specifies the column width
    public func columnWidth<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(ColumnWidthProperty(value))
        return self
    }

    /// Specifies the column width
    public func columnWidth<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        columnWidth(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the column width
    public func columnWidth(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the column width
    public func columnWidth<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.columnWidth, UnitValue(value, unit))
        return self
    }
}
