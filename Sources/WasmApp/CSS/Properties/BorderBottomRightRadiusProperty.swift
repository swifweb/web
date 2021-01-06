//
//  BorderBottomRightRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines the radius of the border of the bottom-right corner
///
/// ```html
/// border-bottom-right-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-bottom-right-radius.asp)
public class BorderBottomRightRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderBottomRightRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var borderBottomRightRadius: PropertyKey<BorderRadiusType> { "_border-bottom-right-radius__".propertyKey() }
}
