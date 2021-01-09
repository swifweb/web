//
//  Bottom.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Sets the elements position, from the bottom of its parent element
///
/// ```html
/// bottom: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_bottom.asp)
public class BottomProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .bottom }
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
    /// Sets the elements position, from the bottom of its parent element
    public static var bottom: PropertyKey<UnitValue> { "bottom".propertyKey() }
}

extension Stylesheet {
    /// Sets the elements position, from the bottom of its parent element
    public typealias Bottom = BottomProperty
}

extension CSSRulable {
    /// Sets the elements position, from the bottom of its parent element
    public func bottom<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.bottom, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(BottomProperty(value))
        return self
    }

    /// Sets the elements position, from the bottom of its parent element
    public func bottom<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        bottom(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the elements position, from the bottom of its parent element
    public func bottom<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.bottom, UnitValue(value, unit))
        return self
    }
}
