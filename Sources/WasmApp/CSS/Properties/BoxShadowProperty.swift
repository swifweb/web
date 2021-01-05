//
//  BoxShadow.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Attaches one or more shadows to an element
///
/// ```html
/// box-shadow: 5px 10px #888888;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_box-shadow.asp)
public class BoxShadowProperty: _Property {
    public var propertyKey: PropertyKey<BoxShadowValue> { .boxShadow }
    public var propertyValue: BoxShadowValue
    var _content = _PropertyContent<BoxShadowValue>()
    
    public init (_ value: BoxShadowValue) {
        propertyValue = value
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: ColorType? = nil) {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
}

extension PropertyKey {
    public static var boxShadow: PropertyKey<BoxShadowValue> { "box-shadow".propertyKey() }
}

public struct BoxShadowValue: CustomStringConvertible {
    public let value: String
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: ColorType? = nil) {
        var elements: [String] = [h.description, v.description]
        if let blur = blur {
            elements.append(blur.numericValue)
        }
        if let spread = spread {
            elements.append(spread.numericValue)
        }
        if let color = color {
            elements.append(color.description)
        }
        value = elements.joined(separator: " ")
    }
    
    public var description: String { value }
}
