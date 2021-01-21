//
//  Right.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the right position of a positioned element
///
/// ```html
/// div.absolute {
///     position: absolute;
///     right: 150px;
///     width: 200px;
///     height: 120px;
///     border: 3px solid green;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_right.asp)
public class RightProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .right }
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
    /// Specifies the right position of a positioned element
    public static var right: PropertyKey<UnitValue> { "right".propertyKey() }
}

extension Stylesheet {
    /// Specifies the right position of a positioned element
    public typealias Right = RightProperty
}

extension CSSRulable {
    /// Specifies the right position of a positioned element
    public func right<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.right, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(RightProperty(value))
        return self
    }

    /// Specifies the right position of a positioned element
    public func right<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        right(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the right position of a positioned element
    public func right(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the right position of a positioned element
    public func right<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.right, UnitValue(value, unit))
        return self
    }
}
