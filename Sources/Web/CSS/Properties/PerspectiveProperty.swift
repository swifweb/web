//
//  Perspective.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Gives a 3D-positioned element some perspective
///
/// ```html
/// perspective: 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_perspective.asp)
public class PerspectiveProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .perspective }
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
    /// Gives a 3D-positioned element some perspective
    public static var perspective: PropertyKey<UnitValue> { "perspective".propertyKey() }
}

extension Stylesheet {
    /// Gives a 3D-positioned element some perspective
    public typealias Perspective = PerspectiveProperty
}

extension CSSRulable {
    /// Gives a 3D-positioned element some perspective
    public func perspective<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.perspective, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(PerspectiveProperty(value))
        return self
    }

    /// Gives a 3D-positioned element some perspective
    public func perspective<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        perspective(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Gives a 3D-positioned element some perspective
    public func perspective(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
    
    /// Gives a 3D-positioned element some perspective
    public func perspective<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.perspective, UnitValue(value, unit))
        return self
    }
}
