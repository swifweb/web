//
//  OutlineOffsetProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Offsets an outline, and draws it beyond the border edge
///
/// ```html
/// outline-offset: 15px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_outline-offset.asp)
public class OutlineOffsetProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .outlineOffset }
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
    public static var outlineOffset: PropertyKey<UnitValue> { "outline-offset".propertyKey() }
}

extension Stylesheet {
    /// Offsets an outline, and draws it beyond the border edge
    public typealias OutlineOffset = OutlineOffsetProperty
}

extension CSSRulable {
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(OutlineOffsetProperty(value))
        return self
    }

    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        outlineOffset(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
    
    /// Offsets an outline, and draws it beyond the border edge
    public func outlineOffset<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.outlineOffset, UnitValue(value, unit))
        return self
    }
}
