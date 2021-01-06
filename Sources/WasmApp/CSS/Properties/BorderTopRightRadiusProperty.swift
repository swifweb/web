//
//  BorderTopRightRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the top-right corner
///
/// ```html
/// border-top-right-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-top-right-radius.asp)
public class BorderTopRightRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderTopRightRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var borderTopRightRadius: PropertyKey<BorderRadiusType> { "border-top-right-radius".propertyKey() }
}
