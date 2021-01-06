//
//  BorderTopProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for border-top-width, border-top-style and border-top-color
///
/// ```html
/// border-top: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top.asp)
public class BorderTopProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderTop }
    public var propertyValue: BorderValue
    var _content = _PropertyContent<BorderValue>()
    
    public init (_ value: BorderValue) {
        propertyValue = value
    }
    
    public init (width: BorderWidthType? = nil, style: BorderStyleType, color: ColorType? = nil) {
        propertyValue = BorderValue(width: width, style: style, color: color)
    }
}

extension PropertyKey {
    public static var borderTop: PropertyKey<BorderValue> { "border-top".propertyKey() }
}
