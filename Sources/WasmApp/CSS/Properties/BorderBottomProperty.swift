//
//  BorderBottomProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for border-bottom-width, border-bottom-style and border-bottom-color
///
/// ```html
/// border-bottom: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom.asp)
public class BorderBottomProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .borderBottom }
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
    public static var borderBottom: PropertyKey<BorderValue> { "border-bottom".propertyKey() }
}
