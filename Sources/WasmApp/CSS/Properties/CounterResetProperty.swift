//
//  CounterReset.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Creates or resets one or more CSS counters
///
/// ```html
/// counter-reset: my-sec-counter;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_gen_counter-reset.asp)
public class CounterResetProperty: _Property {
    public var propertyKey: PropertyKey<CounterResetType> { .counterReset }
    public var propertyValue: CounterResetType
    var _content = _PropertyContent<CounterResetType>()
    
    public init (_ type: CounterResetType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<CounterResetType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, CounterResetType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Creates or resets one or more CSS counters
    public static var counterReset: PropertyKey<CounterResetType> { "counter-reset".propertyKey() }
}

extension Stylesheet {
    /// Creates or resets one or more CSS counters
    public typealias CounterReset = CounterResetProperty
}

extension CSSRulable {
    /// Creates or resets one or more CSS counters
    public func counterReset(_ type: CounterResetType) -> Self {
        s?._addProperty(.counterReset, type)
        return self
    }

    /// Creates or resets one or more CSS counters
    public func counterReset(_ type: State<CounterResetType>) -> Self {
        s?._addProperty(CounterResetProperty(type))
        return self
    }

    /// Creates or resets one or more CSS counters
    public func counterReset<V>(_ type: ExpressableState<V, CounterResetType>) -> Self {
        counterReset(type.unwrap())
    }
}
