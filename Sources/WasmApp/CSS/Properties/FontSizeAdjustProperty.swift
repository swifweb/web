//
//  FontSizeAdjust.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Preserves the readability of text when font fallback occurs
///
/// ```html
/// font-size-adjust: 0.5;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size-adjust)
public class FontSizeAdjustProperty: _Property {
    public var propertyKey: PropertyKey<FontSizeAdjustValue> { .fontSizeAdjust }
    public var propertyValue: FontSizeAdjustValue
    var _content = _PropertyContent<FontSizeAdjustValue>()
    
    public init (_ value: FontSizeAdjustValue) {
        propertyValue = value
    }
    
    public init (_ type: FontSizeAdjustType) {
        propertyValue = .init(type)
    }
    
    public init (_ numeric: NumericValue) {
        propertyValue = .init(numeric)
    }
}

extension PropertyKey {
    public static var fontSizeAdjust: PropertyKey<FontSizeAdjustValue> { "font-size-adjust".propertyKey() }
}

public struct FontSizeAdjustValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontSizeAdjustType) {
        value = type.value
    }
    
    public init (_ numeric: NumericValue) {
        value = numeric.numericValue
    }
    
    public var description: String { value }
}
