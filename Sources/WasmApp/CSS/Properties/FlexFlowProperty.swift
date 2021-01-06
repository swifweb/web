//
//  FlexFlowProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
