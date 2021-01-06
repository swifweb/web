//
//  BorderRightProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for all the border-right-* properties
///
/// ```html
/// border-right: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right.asp)
public class BorderRightProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderRight }
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
    public static var borderRight: PropertyKey<BorderValue> { "border-right".propertyKey() }
}
