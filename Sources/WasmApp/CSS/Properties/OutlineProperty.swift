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

/// Sets the color of an outline
///
/// ```html
/// outline-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-color.asp)
public class OutlineColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .outlineColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init(_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var outlineColor: PropertyKey<ColorType> { "outline-color".propertyKey() }
}

/// Offsets an outline, and draws it beyond the border edge
///
/// ```html
/// outline-offset: 15px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_outline-offset.asp)
public class OutlineOffsetProperty: _Property {
    public var propertyKey: PropertyKey<UnitValue> { .outlineOffset }
    public var propertyValue: UnitValue
    var _content = _PropertyContent<UnitValue>()
    
    public init<U: UnitValuable>(_ v: U) {
        propertyValue = UnitValue(v.value.doubleValue, v.unit)
    }
}

extension PropertyKey {
    public static var outlineOffset: PropertyKey<UnitValue> { "outline-offset".propertyKey() }
}

/// Sets the style of an outline
///
/// ```html
/// outline-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-style.asp)
public class OutlineStyleProperty: _Property {
    public var propertyKey: PropertyKey<OutlineStyleType> { .outlineStyle }
    public var propertyValue: OutlineStyleType
    var _content = _PropertyContent<OutlineStyleType>()
    
    public init (_ type: OutlineStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var outlineStyle: PropertyKey<OutlineStyleType> { "outline-style".propertyKey() }
}

/// Sets the width of an outline
///
/// ```html
/// outline-width: thick;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-width.asp)
public class OutlineWidthProperty: _Property {
    public var propertyKey: PropertyKey<OutlineWidthType> { .outlineWidth }
    public var propertyValue: OutlineWidthType
    var _content = _PropertyContent<OutlineWidthType>()
    
    public init (_ type: OutlineWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var outlineWidth: PropertyKey<OutlineWidthType> { "outline-width".propertyKey() }
}
