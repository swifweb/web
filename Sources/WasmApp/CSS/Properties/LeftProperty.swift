//
//  Left.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the left position of a positioned element
///
/// ```html
/// left: 150px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_left.asp)
public class LeftProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .left }
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
    /// Specifies the left position of a positioned element
    public static var left: PropertyKey<UnitValue> { "left".propertyKey() }
}

extension Stylesheet {
    /// Specifies the left position of a positioned element
    public typealias Left = LeftProperty
}

extension CSSRulable {
    /// Specifies the left position of a positioned element
    public func left<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.left, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(LeftProperty(value))
        return self
    }

    /// Specifies the left position of a positioned element
    public func left<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        left(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the left position of a positioned element
    public func left(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the left position of a positioned element
    public func left<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.left, UnitValue(value, unit))
        return self
    }
}
