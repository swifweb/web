//
//  BorderTopLeftRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the top-left corner
///
/// ```html
/// border-top-left-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-top-left-radius.asp)
public class BorderTopLeftRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderTopLeftRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var borderTopLeftRadius: PropertyKey<BorderRadiusType> { "border-top-left-radius".propertyKey() }
}
