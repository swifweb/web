//
//  FlexShrinkProperty.swift
//  Web
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
    
    public init <N>(_ n: N) where N: StateConvertible, N.Value: NumericValue {
        propertyValue = NumericValueContainer(n)
    }
}

extension PropertyKey {
    /// Specifies how the item will shrink relative to the rest
    public static var flexShrink: PropertyKey<NumericValueContainer> { "flex-shrink".propertyKey() }
}

extension Stylesheet {
    /// Specifies how the item will shrink relative to the rest
    public typealias FlexShrink = FlexShrinkProperty
}

extension CSSRulable {
    /// Specifies how the item will shrink relative to the rest
    public func flexShrink(_ n: NumericValue) -> Self {
        s?._addProperty(FlexShrinkProperty(n))
        return self
    }
    
    /// Specifies how the item will shrink relative to the rest
    public func flexShrink<N>(_ n: N) -> Self where N: StateConvertible, N.Value: NumericValue {
        s?._addProperty(FlexShrinkProperty(n))
        return self
    }
}
