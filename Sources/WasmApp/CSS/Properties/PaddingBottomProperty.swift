//
//  PaddingBottomProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the bottom padding of an element
///
/// ```html
/// padding-bottom: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_padding-bottom.asp)
public class PaddingBottomProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .paddingBottom }
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
    /// Sets the bottom padding of an element
    public static var paddingBottom: PropertyKey<UnitValue> { "padding-bottom".propertyKey() }
}

extension Stylesheet {
    /// Sets the bottom padding of an element
    public typealias PaddingBottom = PaddingBottomProperty
}

extension CSSRulable {
    /// Sets the bottom padding of an element
    public func paddingBottom<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(PaddingBottomProperty(value))
        return self
    }

    /// Sets the bottom padding of an element
    public func paddingBottom<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        paddingBottom(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Sets the bottom padding of an element
    public func paddingBottom(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
    
    /// Sets the bottom padding of an element
    public func paddingBottom<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.paddingBottom, UnitValue(value, unit))
        return self
    }
}
