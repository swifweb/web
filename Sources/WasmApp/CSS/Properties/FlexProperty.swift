//
//  Flex.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for the flex-grow, flex-shrink, and the flex-basis properties
///
/// ```html
/// -ms-flex: 1; /* IE 10 */
/// flex: 1;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex.asp)
public class FlexProperty: _Property {
    public class MS: _Property {
        public var propertyKey: PropertyKey<FlexValue> { .flex_ms }
        public var propertyValue: FlexValue
        var _content = _PropertyContent<FlexValue>()
        
        public init (_ value: FlexValue) {
            propertyValue = value
        }
    
        public init<U: UnitValuable>(grow: NumericValue, shrink: NumericValue, basis: U) {
            propertyValue = .init(grow: grow, shrink: shrink, basis: basis)
        }
    }
    
    public var propertyKey: PropertyKey<FlexValue> { .flex }
    public var propertyValue: FlexValue
    public var propertyAliases: [AnyProperty]
    var _content = _PropertyContent<FlexValue>()
    
    public init (_ value: FlexValue) {
        propertyValue = value
        propertyAliases = [MS(value)]
    }
    
    public init<U: UnitValuable>(grow: NumericValue, shrink: NumericValue, basis: U) {
        propertyValue = .init(grow: grow, shrink: shrink, basis: basis)
        propertyAliases = [MS(grow: grow, shrink: shrink, basis: basis)]
    }
}

extension PropertyKey {
    public static var flex_ms: PropertyKey<FlexValue> { "-ms-flex".propertyKey() }
    static var flex: PropertyKey<FlexValue> { "flex".propertyKey() }
}

public struct FlexValue: CustomStringConvertible {
    public let value: String
    
    public init<U: UnitValuable>(grow: NumericValue, shrink: NumericValue, basis: U) {
        value = [grow.numericValue, shrink.numericValue, basis.description].joined(separator: " ")
    }
    
    public var description: String { value }
}

/// Specifies the initial length of a flexible item
///
/// ```html
/// flex-basis: 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-basis.asp)
public class FlexBasisProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .flexBasis }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var flexBasis: PropertyKey<UnitValue> { "flex-basis".propertyKey() }
}

/// Specifies the direction of the flexible items
///
/// ```html
/// flex-direction: row-reverse;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-direction.asp)
public class FlexDirectionProperty: _Property {
    public var propertyKey: PropertyKey<FlexDirectionType> { .flexDirection }
    public var propertyValue: FlexDirectionType
    var _content = _PropertyContent<FlexDirectionType>()
    
    public init (_ type: FlexDirectionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var flexDirection: PropertyKey<FlexDirectionType> { "flex-direction".propertyKey() }
}

/// A shorthand property for the flex-direction and the flex-wrap properties
///
/// ```html
/// flex-flow: row-reverse wrap;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-flow.asp)
public class FlexFlowProperty: _Property {
    public var propertyKey: PropertyKey<FlexFlowValue> { .flexFlow }
    public var propertyValue: FlexFlowValue
    var _content = _PropertyContent<FlexFlowValue>()
    
    public init (_ value: FlexFlowValue) {
        propertyValue = value
    }
    
    public init (direction: FlexDirectionType, wrap: FlexWrapType) {
        propertyValue = .init(direction: direction, wrap: wrap)
    }
}

extension PropertyKey {
    public static var flexFlow: PropertyKey<FlexFlowValue> { "flex-flow".propertyKey() }
}

public struct FlexFlowValue: CustomStringConvertible {
    public let value: String
    
    public init (direction: FlexDirectionType, wrap: FlexWrapType) {
        value = [direction.value, wrap.value].joined(separator: " ")
    }
    
    public var description: String { value }
}

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

/// Specifies whether the flexible items should wrap or not
///
/// ```html
/// flex-wrap: wrap;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-wrap.asp)
public class FlexWrapProperty: _Property {
    public var propertyKey: PropertyKey<FlexWrapType> { .flexWrap }
    public var propertyValue: FlexWrapType
    var _content = _PropertyContent<FlexWrapType>()
    
    public init (_ type: FlexWrapType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var flexWrap: PropertyKey<FlexWrapType> { "flex-wrap".propertyKey() }
}
