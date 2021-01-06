//
//  BorderImageProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
