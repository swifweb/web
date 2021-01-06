//
//  Border.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for border-width, border-style and border-color
///
/// ```html
/// border: 5px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border.asp)
public class BorderProperty: _Property {
    public var propertyKey: PropertyKey<BorderValue> { .border }
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
    public static var border: PropertyKey<BorderValue> { "border".propertyKey() }
}

public struct BorderValue: CustomStringConvertible {
    public let value: String
    
    public init (width: BorderWidthType? = nil, style: BorderStyleType, color: ColorType? = nil) {
        value = [width?.value, style.value, color?.description].compactMap { $0 }.joined(separator: " ")
    }
    
    public var description: String { value }
}
