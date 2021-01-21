//
//  MaxWidthProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the maximum width of an element
///
/// ```html
/// max-width: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_max-width.asp)
public class MaxWidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .maxWidth }
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
    /// Sets the maximum width of an element
    public static var maxWidth: PropertyKey<UnitValue> { "max-width".propertyKey() }
}

extension Stylesheet {
    /// Sets the maximum width of an element
    public typealias MaxWidth = MaxWidthProperty
}

extension CSSRulable {
    /// Sets the maximum width of an element
    public func maxWidth<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(MaxWidthProperty(value))
        return self
    }

    /// Sets the maximum width of an element
    public func maxWidth<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        maxWidth(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the maximum width of an element
    public func maxWidth(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
    
    /// Sets the maximum width of an element
    public func maxWidth<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.maxWidth, UnitValue(value, unit))
        return self
    }
}
