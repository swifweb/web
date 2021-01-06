//
//  BorderBottomLeftRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the bottom-left corner
///
/// ```html
/// border-bottom-left-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-bottom-left-radius.asp)
public class BorderBottomLeftRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderBottomLeftRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var borderBottomLeftRadius: PropertyKey<BorderRadiusType> { "border-bottom-left-radius".propertyKey() }
}
