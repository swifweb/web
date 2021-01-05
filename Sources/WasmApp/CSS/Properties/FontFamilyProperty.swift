//
//  FontFamily.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the font family for text
///
/// ```html
///
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family)
public class FontFamilyProperty: _Property {
    public var propertyKey: PropertyKey<FontFamilyValue> { .fontFamily }
    public var propertyValue: FontFamilyValue
    var _content = _PropertyContent<FontFamilyValue>()
    
    public init (_ value: FontFamilyValue) {
        propertyValue = value
    }
    
    public init (_ type: FontFamilyType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [FontFamilyType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var fontFamily: PropertyKey<FontFamilyValue> { "font-family".propertyKey() }
}

public struct FontFamilyValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontFamilyType...) {
        value = type.map { $0.value }.joined(separator: ", ")
    }
    
    public init (_ type: [FontFamilyType]) {
        value = type.map { $0.value }.joined(separator: ", ")
    }
    
    public var description: String { value }
}
