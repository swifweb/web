//
//  CounterIncrement.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var counterIncrement: PropertyKey<CounterResetType> { "counter-increment".propertyKey() }
}
