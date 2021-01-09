//
//  CounterIncrement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Increases or decreases the value of one or more CSS counters
///
/// ```html
/// counter-reset: my-sec-counter;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_gen_counter-increment.asp)
public class CounterIncrementProperty: _Property {
    public var propertyKey: PropertyKey<CounterResetType> { .counterIncrement }
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
    /// Increases or decreases the value of one or more CSS counters
    public static var counterIncrement: PropertyKey<CounterResetType> { "counter-increment".propertyKey() }
}

extension Stylesheet {
    /// Increases or decreases the value of one or more CSS counters
    public typealias CounterIncrement = CounterIncrementProperty
}

extension CSSRulable {
    /// Increases or decreases the value of one or more CSS counters
    public func counterIncrement(_ type: CounterResetType) -> Self {
        s?._addProperty(.counterIncrement, type)
        return self
    }

    /// Increases or decreases the value of one or more CSS counters
    public func counterIncrement(_ type: State<CounterResetType>) -> Self {
        s?._addProperty(CounterIncrementProperty(type))
        return self
    }

    /// Increases or decreases the value of one or more CSS counters
    public func counterIncrement<V>(_ type: ExpressableState<V, CounterResetType>) -> Self {
        counterIncrement(type.unwrap())
    }
}
