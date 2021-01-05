//
//  CounterReset.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var counterReset: PropertyKey<CounterResetType> { "counter-reset".propertyKey() }
}
