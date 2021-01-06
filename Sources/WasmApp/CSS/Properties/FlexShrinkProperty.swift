//
//  FlexShrinkProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies how the item will shrink relative to the rest
///
/// ```html
/// flex-shrink: 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-shrink.asp)
public class FlexShrinkProperty: _Property {
    public var propertyKey: PropertyKey<NumericValueContainer> { .flexShrink }
    public var propertyValue: NumericValueContainer
    var _content = _PropertyContent<NumericValueContainer>()
    
    public init (_ n: NumericValue) {
        propertyValue = NumericValueContainer(n)
    }
}

extension PropertyKey {
    public static var flexShrink: PropertyKey<NumericValueContainer> { "flex-shrink".propertyKey() }
}
