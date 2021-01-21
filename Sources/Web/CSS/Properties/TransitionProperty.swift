//
//  Transition.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// A shorthand property for all the transition-* properties
///
/// ```html
/// div {
///     width: 100px;
///     transition: width 2s;
/// }
///
/// div:hover {
///     width: 300px;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transition.asp)
public class TransitionProperty: _Property {
    public var propertyKey: PropertyKey<TransitionValue> { .transition }
    public var propertyValue: TransitionValue
    var _content = _PropertyContent<TransitionValue>()
    
    public init (_ properties: [TransitionPropertyType], duration: TimeType, timingFunction: TransitionTimingFunctionType? = nil, delay: TimeType? = nil) {
        propertyValue = TransitionValue(properties, duration: duration, timingFunction: timingFunction, delay: delay)
    }
    
    public convenience init (_ properties: TransitionPropertyType..., duration: TimeType, timingFunction: TransitionTimingFunctionType? = nil, delay: TimeType? = nil) {
        self.init(properties, duration: duration, timingFunction: timingFunction, delay: delay)
    }
}

extension PropertyKey {
    /// A shorthand property for all the transition-* properties
    public static var transition: PropertyKey<TransitionValue> { "transition".propertyKey() }
}

public struct TransitionValue: CustomStringConvertible {
    let properties: [TransitionPropertyType]
    let duration: TimeType
    let timingFunction: TransitionTimingFunctionType?
    let delay: TimeType?
    
    public init (_ properties: [TransitionPropertyType], duration: TimeType, timingFunction: TransitionTimingFunctionType? = nil, delay: TimeType? = nil) {
        self.properties = properties
        self.duration = duration
        self.timingFunction = timingFunction
        self.delay = delay
    }
    
    public var description: String {
        var values: [String] = []
        values.append(properties.map { $0.value }.joined(separator: ", "))
        values.append(duration.value)
        if let timingFunction = timingFunction {
            values.append(timingFunction.value)
        }
        if let delay = delay {
            values.append(delay.value)
        }
        return values.joined(separator: " ")
    }
}

extension Stylesheet {
    /// A shorthand property for all the transition-* properties
    public typealias Transition = TransitionProperty
}

extension CSSRulable {
    /// A shorthand property for all the transition-* properties
    public func transition(_ properties: [TransitionPropertyType], duration: TimeType, timingFunction: TransitionTimingFunctionType? = nil, delay: TimeType? = nil) -> Self {
        s?._addProperty(TransitionProperty(properties, duration: duration, timingFunction: timingFunction, delay: delay))
        return self
    }
    
    /// A shorthand property for all the transition-* properties
    public func transition(_ properties: TransitionPropertyType..., duration: TimeType, timingFunction: TransitionTimingFunctionType? = nil, delay: TimeType? = nil) -> Self {
        transition(properties, duration: duration, timingFunction: timingFunction, delay: delay)
    }
}
