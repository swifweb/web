//
//  AnimationDuration.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how long an animation should take to complete one cycle
///
/// ```html
/// animation-duration: 3s;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-duration.asp)
public class AnimationDurationProperty: _Property {
    public var propertyKey: PropertyKey<TimeUnitValueContainer> { .animationDuration }
    public var propertyValue: TimeUnitValueContainer
    var _content = _PropertyContent<TimeUnitValueContainer>()
    
    public init<U: TimeUnitValue>(_ value: U) {
        propertyValue = TimeUnitValueContainer(value.value.doubleValue, value.timeUnit)
    }
    
    public convenience init <U: TimeUnitValue>(_ value: State<U>) {
        self.init(value.wrappedValue)
        value.listen { self._changed(to: TimeUnitValueContainer($0.value.doubleValue, $0.timeUnit)) }
    }

    public convenience init <V, U: TimeUnitValue>(_ value: ExpressableState<V, U>) {
        self.init(value.unwrap())
    }
    
    // MARK: Extended
    
    public convenience init (_ value: Double, _ timeUnit: TimeUnit) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init (_ value: State<Double>, _ timeUnit: TimeUnit) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init (_ value: Double, _ timeUnit: State<TimeUnit>) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init <V>(_ value: ExpressableState<V, Double>, _ timeUnit: TimeUnit) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init <V>(_ value: Double, _ timeUnit: ExpressableState<V, TimeUnit>) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init <V>(_ value: State<Double>, _ timeUnit: ExpressableState<V, TimeUnit>) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init <V>(_ value: ExpressableState<V, Double>, _ timeUnit: State<TimeUnit>) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init (_ value: State<Double>, _ timeUnit: State<TimeUnit>) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
    
    public convenience init <V, U>(_ value: ExpressableState<V, Double>, _ timeUnit: ExpressableState<U, TimeUnit>) {
        self.init(TimeUnitValueContainer(value, timeUnit))
    }
}

extension PropertyKey {
    /// Specifies how long an animation should take to complete one cycle
    public static var animationDuration: PropertyKey<TimeUnitValueContainer> { "animation-duration".propertyKey() }
}

extension Stylesheet {
    /// Specifies how long an animation should take to complete one cycle
    public typealias AnimationDuration = AnimationDurationProperty
}

extension CSSRulable {
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<U: TimeUnitValue>(_ value: U) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value.value.doubleValue, value.timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<U: TimeUnitValue>(_ value: State<U>) -> Self {
        s?._addProperty(AnimationDurationProperty(value))
        return self
    }

    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<V, U: TimeUnitValue>(_ value: ExpressableState<V, U>) -> Self {
        animationDuration(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration(_ value: Double, _ timeUnit: TimeUnit) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration(_ value: State<Double>, _ timeUnit: TimeUnit) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration(_ value: Double, _ timeUnit: State<TimeUnit>) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<V>(_ value: ExpressableState<V, Double>, _ timeUnit: TimeUnit) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<V>(_ value: Double, _ timeUnit: ExpressableState<V, TimeUnit>) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<V>(_ value: State<Double>, _ timeUnit: ExpressableState<V, TimeUnit>) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<V>(_ value: ExpressableState<V, Double>, _ timeUnit: State<TimeUnit>) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration(_ value: State<Double>, _ timeUnit: State<TimeUnit>) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies how long an animation should take to complete one cycle
    public func animationDuration<V, U>(_ value: ExpressableState<V, Double>, _ timeUnit: ExpressableState<U, TimeUnit>) -> Self {
        s?._addProperty(.animationDuration, TimeUnitValueContainer(value, timeUnit))
        return self
    }
}
