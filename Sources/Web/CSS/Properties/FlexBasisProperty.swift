//
//  FlexBasisProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the initial length of a flexible item
///
/// ```html
/// flex-basis: 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-basis.asp)
public class FlexBasisProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .flexBasis }
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
    /// Specifies the initial length of a flexible item
    public static var flexBasis: PropertyKey<UnitValue> { "flex-basis".propertyKey() }
}

extension Stylesheet {
    /// Specifies the initial length of a flexible item
    public typealias FlexBasis = FlexBasisProperty
}

extension CSSRulable {
    /// Specifies the initial length of a flexible item
    public func flexBasis<U: UnitValuable>(_ value: U) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value.value.doubleValue, value.unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis<U: UnitValuable>(_ value: State<U>) -> Self {
        s?._addProperty(FlexBasisProperty(value))
        return self
    }

    /// Specifies the initial length of a flexible item
    public func flexBasis<V, U: UnitValuable>(_ value: ExpressableState<V, U>) -> Self {
        flexBasis(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies the initial length of a flexible item
    public func flexBasis(_ value: Double, _ unit: Unit) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis(_ value: State<Double>, _ unit: Unit) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis(_ value: Double, _ unit: State<Unit>) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis<V>(_ value: ExpressableState<V, Double>, _ unit: Unit) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis<V>(_ value: Double, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis<V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis<V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis(_ value: State<Double>, _ unit: State<Unit>) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
    
    /// Specifies the initial length of a flexible item
    public func flexBasis<V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) -> Self {
        s?._addProperty(.flexBasis, UnitValue(value, unit))
        return self
    }
}
