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
    
    public init<U: UnitValuable>(width: U, style: OutlineStyleType, color: Color) {
        propertyValue = OutlineValue(width: width, style: style, color: color)
    }
}

extension PropertyKey {
    /// A shorthand property for the outline-width, outline-style, and the outline-color properties
    public static var outline: PropertyKey<OutlineValue> { "outline".propertyKey() }
}

public struct OutlineValue: CustomStringConvertible {
    let width: UnitValue
    let style: OutlineStyleType
    let color: Color
    
    public init<U: UnitValuable>(width: U, style: OutlineStyleType, color: Color) {
        self.width = UnitValue(width.value.doubleValue, width.unit)
        self.style = style
        self.color = color
    }
    
    public var description: String {
        [width.description, style.value, color.description].joined(separator: " ")
    }
}

extension Stylesheet {
    /// A shorthand property for the outline-width, outline-style, and the outline-color properties
    public typealias Outline = OutlineProperty
}

extension CSSRulable {
    /// A shorthand property for the outline-width, outline-style, and the outline-color properties
    public func outline<U: UnitValuable>(width: U, style: OutlineStyleType, color: Color) -> Self {
        s?._addProperty(OutlineProperty(width: width, style: style, color: color))
        return self
    }
}
