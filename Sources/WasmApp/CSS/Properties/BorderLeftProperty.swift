//
//  BorderLeftProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for all the border-left-* properties
///
/// ```html
/// border-left: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left.asp)
public class BorderLeftProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderLeft }
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
    public static var borderLeft: PropertyKey<BorderValue> { "border-left".propertyKey() }
}
