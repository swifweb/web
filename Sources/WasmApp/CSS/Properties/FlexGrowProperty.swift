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
    
    public init <N>(_ n: N) where N: StateConvertible, N.Value: NumericValue {
        propertyValue = NumericValueContainer(n)
    }
}

extension PropertyKey {
    /// Specifies how much the item will grow relative to the rest
    public static var flexGrow: PropertyKey<NumericValueContainer> { "flex-grow".propertyKey() }
}

extension Stylesheet {
    /// Specifies how much the item will grow relative to the rest
    public typealias FlexGrow = FlexGrowProperty
}

extension CSSRulable {
    /// Specifies how much the item will grow relative to the rest
    public func flexGrow(_ n: NumericValue) -> Self {
        s?._addProperty(FlexGrowProperty(n))
        return self
    }
    
    /// Specifies how much the item will grow relative to the rest
    public func flexGrow<N>(_ n: N) -> Self where N: StateConvertible, N.Value: NumericValue {
        s?._addProperty(FlexGrowProperty(n))
        return self
    }
}
