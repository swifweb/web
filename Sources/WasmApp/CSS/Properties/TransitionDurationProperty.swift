//
//  TransitionDuration.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how many seconds or milliseconds a transition effect takes to complete
///
/// ```html
/// div {
///     transition-duration: 5s;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition-duration.asp)
public class TransitionDurationProperty: _Property {
    public var propertyKey: PropertyKey<TimeType> { .transitionDuration }
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
    /// Specifies how many seconds or milliseconds a transition effect takes to complete
    public static var transitionDuration: PropertyKey<TimeType> { "transition-duration".propertyKey() }
}

extension Stylesheet {
    /// Specifies how many seconds or milliseconds a transition effect takes to complete
    public typealias TransitionDuration = TransitionDurationProperty
}

extension CSSRulable {
    /// Specifies how many seconds or milliseconds a transition effect takes to complete
    public func transitionDuration(_ type: TimeType) -> Self {
        s?._addProperty(TransitionDurationProperty(type))
        return self
    }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete
    public func transitionDuration<A>(_ value: A) -> Self where A: StateConvertible, A.Value == TimeType {
        s?._addProperty(TransitionDurationProperty(value))
        return self
    }
}
