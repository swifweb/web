//
//  FlexGrowProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies how much the item will grow relative to the rest
///
/// ```html
/// flex-grow: 3;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-grow.asp)
public class FlexGrowProperty: _Property {
    public var propertyKey: PropertyKey<NumericValueContainer> { .flexGrow }
    public var propertyValue: NumericValueContainer
    var _content = _PropertyContent<NumericValueContainer>()
    
    public init (_ n: NumericValue) {
        propertyValue = NumericValueContainer(n)
    }
}

extension PropertyKey {
    public static var flexGrow: PropertyKey<NumericValueContainer> { "flex-grow".propertyKey() }
}
