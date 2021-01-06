//
//  AnimationDelay.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies a delay for the start of an animation
///
/// ```html
/// animation-delay: 2s;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_animation-delay.asp)
public class AnimationDelayProperty: _Property {
    public var propertyKey: PropertyKey<TimeUnitValueContainer> { .animationDelay }
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
    /// Specifies a delay for the start of an animation
    public static var animationDelay: PropertyKey<TimeUnitValueContainer> { "animation-delay".propertyKey() }
}

extension Stylesheet {
    /// Specifies a delay for the start of an animation
    public typealias AnimationDelay = AnimationDelayProperty
}

extension CSSRulable {
    /// Specifies a delay for the start of an animation
    public func animationDelay<U: TimeUnitValue>(_ value: U) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value.value.doubleValue, value.timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay<U: TimeUnitValue>(_ value: State<U>) -> Self {
        s?._addProperty(AnimationDelayProperty(value))
        return self
    }

    /// Specifies a delay for the start of an animation
    public func animationDelay<V, U: TimeUnitValue>(_ value: ExpressableState<V, U>) -> Self {
        animationDelay(value.unwrap())
    }
    
    // MARK: Extended
    
    /// Specifies a delay for the start of an animation
    public func animationDelay(_ value: Double, _ timeUnit: TimeUnit) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay(_ value: State<Double>, _ timeUnit: TimeUnit) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay(_ value: Double, _ timeUnit: State<TimeUnit>) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay<V>(_ value: ExpressableState<V, Double>, _ timeUnit: TimeUnit) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay<V>(_ value: Double, _ timeUnit: ExpressableState<V, TimeUnit>) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay<V>(_ value: State<Double>, _ timeUnit: ExpressableState<V, TimeUnit>) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay<V>(_ value: ExpressableState<V, Double>, _ timeUnit: State<TimeUnit>) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay(_ value: State<Double>, _ timeUnit: State<TimeUnit>) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
    
    /// Specifies a delay for the start of an animation
    public func animationDelay<V, U>(_ value: ExpressableState<V, Double>, _ timeUnit: ExpressableState<U, TimeUnit>) -> Self {
        s?._addProperty(.animationDelay, TimeUnitValueContainer(value, timeUnit))
        return self
    }
}
