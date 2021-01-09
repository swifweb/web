//
//  TransitionDelay.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies when the transition effect will start
///
/// ```html
/// div {
///     transition-delay: 2s;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-delay.asp)
public class TransitionDelayProperty: _Property {
    public var propertyKey: PropertyKey<TimeType> { .transitionDelay }
    public var propertyValue: TimeType
    var _content = _PropertyContent<TimeType>()
    
    public init (_ type: TimeType) {
        propertyValue = type
    }
    
    public convenience init <A>(_ value: A) where A: StateConvertible, A.Value == TimeType {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen { self._changed(to: $0) }
    }
}

extension PropertyKey {
    /// Specifies when the transition effect will start
    public static var transitionDelay: PropertyKey<TimeType> { "transition-delay".propertyKey() }
}

extension Stylesheet {
    /// Specifies when the transition effect will start
    public typealias TransitionDelay = TransitionDelayProperty
}

extension CSSRulable {
    /// Specifies when the transition effect will start
    public func transitionDelay(_ type: TimeType) -> Self {
        s?._addProperty(TransitionDelayProperty(type))
        return self
    }
    
    /// Specifies when the transition effect will start
    public func transitionDelay<A>(_ value: A) -> Self where A: StateConvertible, A.Value == TimeType {
        s?._addProperty(TransitionDelayProperty(value))
        return self
    }
}
