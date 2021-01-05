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

/// Sets the color of the bottom border
///
/// ```html
/// border-bottom-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_color.asp)
public class BorderBottomColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderBottomColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderBottomColor: PropertyKey<ColorType> { "border-bottom-color".propertyKey() }
}

/// Defines the radius of the border of the bottom-left corner
///
/// ```html
/// border-bottom-left-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-bottom-left-radius.asp)
public class BorderBottomLeftRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderBottomLeftRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var borderBottomLeftRadius: PropertyKey<BorderRadiusType> { "border-bottom-left-radius".propertyKey() }
}

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

/// Sets the style of the bottom border
///
/// ```html
/// border-bottom-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_style.asp)
public class BorderBottomStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderBottomStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderBottomStyle: PropertyKey<BorderStyleType> { "border-bottom-style".propertyKey() }
}

/// Sets the width of the bottom border
///
/// ```html
/// border-bottom-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-bottom_width.asp)
public class BorderBottomWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderBottomWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderBottomWidth: PropertyKey<BorderWidthType> { "border-bottom-width".propertyKey() }
}

/// Sets whether table borders should collapse into a single border or be separated
///
/// ```html
/// border-collapse: separate;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-collapse.asp)
public class BorderCollapseProperty: _Property {
    public var propertyKey: PropertyKey<BorderCollapseType> { .borderCollapse }
    public var propertyValue: BorderCollapseType
    var _content = _PropertyContent<BorderCollapseType>()
    
    public init (_ type: BorderCollapseType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderCollapse: PropertyKey<BorderCollapseType> { "border-collapse".propertyKey() }
}

/// Sets the color of the four borders
///
/// ```html
/// border-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-color.asp)
public class BorderColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderColor: PropertyKey<ColorType> { "border-color".propertyKey() }
}

/// A shorthand property for all the border-image-* properties
///
/// ```html
/// border-image: url(border.png) 30 round;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image.asp)
public class BorderImageProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageValue> { .borderImage }
    public var propertyValue: BorderImageValue
    var _content = _PropertyContent<BorderImageValue>()
    
    public init (_ value: BorderImageValue) {
        propertyValue = value
    }
    
    public init (source: String, slice: BorderImageSliceType? = nil, width: BorderWidthType? = nil, outset: BorderImageOutsetType? = nil, repeat: BorderImageRepeatType? = nil) {
        propertyValue = BorderImageValue(source: source, slice: slice, width: width, outset: outset, repeat: `repeat`)
    }
}

extension PropertyKey {
    public static var borderImage: PropertyKey<BorderImageValue> { "border-image".propertyKey() }
}

public struct BorderImageValue: CustomStringConvertible {
    public let value: String
    
    public init (source: String, slice: BorderImageSliceType? = nil, width: BorderWidthType? = nil, outset: BorderImageOutsetType? = nil, repeat: BorderImageRepeatType? = nil) {
        value = ["url(\(source)", slice?.value, width?.value, outset?.value, `repeat`?.value].compactMap { $0 }.joined(separator: " ")
    }
    
    public var description: String { value }
}

/// Specifies the amount by which the border image area extends beyond the border box
///
/// ```html
/// border-image-outset: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-outset.asp)
public class BorderImageOutsetProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageOutsetType> { .borderImageOutset }
    public var propertyValue: BorderImageOutsetType
    var _content = _PropertyContent<BorderImageOutsetType>()
    
    public init (_ type: BorderImageOutsetType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageOutset: PropertyKey<BorderImageOutsetType> { "border-image-outset".propertyKey() }
}

/// Specifies whether the border image should be repeated, rounded or stretched
///
/// ```html
/// border-image-repeat: repeat;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-repeat.asp)
public class BorderImageRepeatProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageRepeatType> { .borderImageRepeat }
    public var propertyValue: BorderImageRepeatType
    var _content = _PropertyContent<BorderImageRepeatType>()
    
    public init (_ type: BorderImageRepeatType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageRepeat: PropertyKey<BorderImageRepeatType> { "border-image-repeat".propertyKey() }
}

/// Specifies how to slice the border image
///
/// ```html
/// border-image-slice: 30%;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-slice.asp)
public class BorderImageSliceProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageSliceType> { .borderImageSlice }
    public var propertyValue: BorderImageSliceType
    var _content = _PropertyContent<BorderImageSliceType>()
    
    public init (_ type: BorderImageSliceType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageSlice: PropertyKey<BorderImageSliceType> { "border-image-slice".propertyKey() }
}

/// Specifies the path to the image to be used as a border
///
/// ```html
/// border-image-source: url(border.png);
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-source.asp)
public class BorderImageSourceProperty: _Property {
    public var propertyKey: PropertyKey<String> { .borderImageSource }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ src: String) {
        propertyValue = "url(\(src)"
    }
}

extension PropertyKey {
    public static var borderImageSource: PropertyKey<String> { "border-image-source".propertyKey() }
}

/// Specifies the width of the border image
///
/// ```html
/// border-image-width: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-width.asp)
public class BorderImageWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderImageWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageWidth: PropertyKey<BorderWidthType> { "border-image-width".propertyKey() }
}

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

/// Sets the color of the left border
///
/// ```html
/// border-left-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_color.asp)
public class BorderLeftColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderLeftColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderLeftColor: PropertyKey<ColorType> { "border-left-color".propertyKey() }
}

/// Sets the style of the left border
///
/// ```html
/// border-left-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_style.asp)
public class BorderLeftStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderLeftStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderLeftStyle: PropertyKey<BorderStyleType> { "border-left-style".propertyKey() }
}

/// Sets the width of the left border
///
/// ```html
/// border-left-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-left_width.asp)
public class BorderLeftWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderLeftWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderLeftWidth: PropertyKey<BorderWidthType> { "border-left-width".propertyKey() }
}

/// A shorthand property for the four border-*-radius properties
///
/// ```html
/// border: 2px solid red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-radius.asp)
public class BorderRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusValue> { .borderRadius }
    public var propertyValue: BorderRadiusValue
    var _content = _PropertyContent<BorderRadiusValue>()
    
    public init (_ value: BorderRadiusValue) {
        propertyValue = value
    }
    
    public init (all: BorderRadiusType) {
        propertyValue = BorderRadiusValue(all: all)
    }
    
    public init (topLeft: BorderRadiusType, bottomRight: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft)
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft)
    }
}

extension PropertyKey {
    public static var borderRadius: PropertyKey<BorderRadiusValue> { "border-radius".propertyKey() }
}

public struct BorderRadiusValue: CustomStringConvertible {
    public let value: String
    
    public init (all: BorderRadiusType) {
        value = all.value
    }
    
    public init (topLeft: BorderRadiusType, bottomRight: BorderRadiusType) {
        value = [topLeft.value, bottomRight.value].joined(separator: " ")
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        value = [topLeft.value, topRight.value, bottomLeft.value].joined(separator: " ")
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        value = [topLeft.value, topRight.value, bottomRight.value, bottomLeft.value].joined(separator: " ")
    }
    
    public var description: String { value }
}

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

/// Sets the color of the right border
///
/// ```html
/// border-right-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_color.asp)
public class BorderRightColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderRightColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderRightColor: PropertyKey<ColorType> { "border-right-color".propertyKey() }
}

/// Sets the style of the right border
///
/// ```html
/// border-right-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_style.asp)
public class BorderRightStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderRightStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderRightStyle: PropertyKey<BorderStyleType> { "border-right-style".propertyKey() }
}

/// Sets the width of the right border
///
/// ```html
/// border-right-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-right_width.asp)
public class BorderRightWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderRightWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderRightWidth: PropertyKey<BorderWidthType> { "border-right-width".propertyKey() }
}

/// Sets the distance between the borders of adjacent cells
///
/// ```html
/// border-spacing: 15px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-spacing.asp)
public class BorderSpacingProperty: _Property {
    public var propertyKey: PropertyKey<BorderSpacingValue> { .borderSpacing }
    public var propertyValue: BorderSpacingValue
    var _content = _PropertyContent<BorderSpacingValue>()
    
    public init (_ value: BorderSpacingValue) {
        propertyValue = value
    }
    
    public init<U: UnitValuable>(all: U) {
        propertyValue = BorderSpacingValue(all: all)
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V) {
        propertyValue = BorderSpacingValue(h: h, v: v)
    }
}

extension PropertyKey {
    public static var borderSpacing: PropertyKey<BorderSpacingValue> { "border-spacing".propertyKey() }
}

public struct BorderSpacingValue: CustomStringConvertible {
    public let value: String
    
    public init<U: UnitValuable>(all: U) {
        value = all.description
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V) {
        value = [h.description, v.description].joined(separator: " ")
    }
    
    public var description: String { value }
}

/// Sets the style of the four borders
///
/// ```html
/// border-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-style.asp)
public class BorderStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleValue> { .borderStyle }
    public var propertyValue: BorderStyleValue
    var _content = _PropertyContent<BorderStyleValue>()
    
    public init (_ value: BorderStyleValue) {
        propertyValue = value
    }
    
    public init (_ type: BorderStyleType...) {
        propertyValue = BorderStyleValue(type)
    }
    
    public init (_ type: [BorderStyleType]) {
        propertyValue = BorderStyleValue(type)
    }
}

extension PropertyKey {
    public static var borderStyle: PropertyKey<BorderStyleValue> { "border-style".propertyKey() }
}

public struct BorderStyleValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: BorderStyleType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [BorderStyleType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}

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

/// Sets the color of the top border
///
/// ```html
/// border-top-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_color.asp)
public class BorderTopColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .borderTopColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var borderTopColor: PropertyKey<ColorType> { "border-top-color".propertyKey() }
}

/// Defines the radius of the border of the top-left corner
///
/// ```html
/// border-top-left-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-top-left-radius.asp)
public class BorderTopLeftRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderTopLeftRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var borderTopLeftRadius: PropertyKey<BorderRadiusType> { "border-top-left-radius".propertyKey() }
}

/// Defines the radius of the border of the top-right corner
///
/// ```html
/// border-top-right-radius: 25px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-top-right-radius.asp)
public class BorderTopRightRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusType> { .borderTopRightRadius }
    public var propertyValue: BorderRadiusType
    var _content = _PropertyContent<BorderRadiusType>()
    
    public init (_ value: BorderRadiusType) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var borderTopRightRadius: PropertyKey<BorderRadiusType> { "border-top-right-radius".propertyKey() }
}

/// Sets the style of the top border
///
/// ```html
/// border-top-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_style.asp)
public class BorderTopStyleProperty: _Property {
    public var propertyKey: PropertyKey<BorderStyleType> { .borderTopStyle }
    public var propertyValue: BorderStyleType
    var _content = _PropertyContent<BorderStyleType>()
    
    public init (_ type: BorderStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderTopStyle: PropertyKey<BorderStyleType> { "border-top-style".propertyKey() }
}

/// Sets the width of the top border
///
/// ```html
/// border-top-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-top_width.asp)
public class BorderTopWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthType> { .borderTopWidth }
    public var propertyValue: BorderWidthType
    var _content = _PropertyContent<BorderWidthType>()
    
    public init (_ type: BorderWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderTopWidth: PropertyKey<BorderWidthType> { "border-top-width".propertyKey() }
}

/// Sets the width of the four borders
///
/// ```html
/// border-width: thin;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-width.asp)
public class BorderWidthProperty: _Property {
    public var propertyKey: PropertyKey<BorderWidthValue> { .borderWidth }
    public var propertyValue: BorderWidthValue
    var _content = _PropertyContent<BorderWidthValue>()
    
    public init (_ value: BorderWidthValue) {
        propertyValue = value
    }
    
    public init (_ type: BorderWidthType...) {
        propertyValue = BorderWidthValue(type)
    }
    
    public init (_ type: [BorderWidthType]) {
        propertyValue = BorderWidthValue(type)
    }
}

extension PropertyKey {
    public static var borderWidth: PropertyKey<BorderWidthValue> { "border-width".propertyKey() }
}

public struct BorderWidthValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: BorderWidthType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [BorderWidthType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
