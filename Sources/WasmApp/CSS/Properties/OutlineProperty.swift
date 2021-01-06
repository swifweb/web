//
//  Outline.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// A shorthand property for the outline-width, outline-style, and the outline-color properties
///
/// ```html
/// outline: 5px dotted green;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline.asp)
public class OutlineProperty: _Property {
    public var propertyKey: PropertyKey<OutlineValue> { .outline }
    public var propertyValue: OutlineValue
    var _content = _PropertyContent<OutlineValue>()
    
    public init<U: UnitValuable>(width: U, style: OutlineStyleType, color: ColorType) {
        propertyValue = OutlineValue(width: width, style: style, color: color)
    }
}

extension PropertyKey {
    public static var outline: PropertyKey<OutlineValue> { "outline".propertyKey() }
}

public struct OutlineValue: CustomStringConvertible {
    let width: UnitValue
    let style: OutlineStyleType
    let color: ColorType
    
    public init<U: UnitValuable>(width: U, style: OutlineStyleType, color: ColorType) {
        self.width = UnitValue(width.value.doubleValue, width.unit)
        self.style = style
        self.color = color
    }
    
    public var description: String {
        [width.description, style.value, color.description].joined(separator: " ")
    }
}
