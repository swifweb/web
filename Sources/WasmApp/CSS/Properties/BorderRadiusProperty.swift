//
//  BorderRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the four border-*-radius properties
///
/// ```html
/// border: 2px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-radius.asp)
public class BorderRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusValue> { .borderRadius }
    public var propertyValue: BorderRadiusValue
    var _content = _PropertyContent<BorderRadiusValue>()
    
    public init (_ value: BorderRadiusValue) {
        propertyValue = value
    }
    
    public init (all: BorderRadiusType) {
        propertyValue = BorderRadiusValue(all: all)
    }
    
    public init (topLeft: BorderRadiusType, bottomRight: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft)
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft)
    }
}

extension PropertyKey {
    public static var borderRadius: PropertyKey<BorderRadiusValue> { "border-radius".propertyKey() }
}

public struct BorderRadiusValue: CustomStringConvertible {
    public let value: String
    
    public init (all: BorderRadiusType) {
        value = all.value
    }
    
    public init (topLeft: BorderRadiusType, bottomRight: BorderRadiusType) {
        value = [topLeft.value, bottomRight.value].joined(separator: " ")
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        value = [topLeft.value, topRight.value, bottomLeft.value].joined(separator: " ")
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        value = [topLeft.value, topRight.value, bottomRight.value, bottomLeft.value].joined(separator: " ")
    }
    
    public var description: String { value }
}
