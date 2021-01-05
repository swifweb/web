//
//  FontVariant.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies whether or not a text should be displayed in a small-caps font
///
/// ```html
/// font-variant: small-caps;
/// font-variant: common-ligatures small-caps;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant)
public class FontVariantProperty: _Property {
    public var propertyKey: PropertyKey<FontVariantValue> { .fontVariant }
    public var propertyValue: FontVariantValue
    var _content = _PropertyContent<FontVariantValue>()
    
    public init (_ value: FontVariantValue) {
        propertyValue = value
    }
    
    public init (_ type: FontVariantType...) {
        propertyValue = .init(type)
    }
    
    public init (_ type: [FontVariantType]) {
        propertyValue = .init(type)
    }
}

extension PropertyKey {
    public static var fontVariant: PropertyKey<FontVariantValue> { "font-variant".propertyKey() }
}

public struct FontVariantValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontVariantType...) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public init (_ type: [FontVariantType]) {
        value = type.map { $0.value }.joined(separator: " ")
    }
    
    public var description: String { value }
}
