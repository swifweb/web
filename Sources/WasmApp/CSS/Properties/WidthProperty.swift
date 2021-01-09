//
//  Width.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the width of an element
///
/// ```html
/// div.a {
///     width: auto;
///     border: 1px solid black;
/// }
///
/// div.b {
///     width: 150px;
///     border: 1px solid black;
/// }
///
/// div.c {
///     width: 50%;
///     border: 1px solid black;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_width.asp)
public class WidthProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .width }
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
    /// Sets the width of an element
    public static var width: PropertyKey<UnitValue> { "width".propertyKey() }
}

extension Stylesheet {
    /// Sets the width of an element
    public typealias Width = WidthProperty
}

extension CSSRulable {
    /// Sets the width of an element
    public func width<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.width, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the width of an element
    public func width<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(WidthProperty(value))
        return self
    }

    /// Sets the width of an element
    public func width<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        width(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the width of an element
    public func width(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
    
    /// Sets the width of an element
    public func width<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.width, UnitValue(value, unit))
        return self
    }
}
