//
//  FontWeight.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the weight of a font
///
/// ```html
/// font-weight: normal;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_font_weight.asp)
public class FontWeightProperty: _Property {
    public var propertyKey: PropertyKey<FontWeightValue> { .fontWeight }
    public var propertyValue: FontWeightValue
    var _content = _PropertyContent<FontWeightValue>()
    
    public init (_ value: FontWeightValue) {
        propertyValue = value
    }
    
    public init (_ type: FontWeightType) {
        propertyValue = .init(type)
    }
    
    public init (_ n: Int) {
        propertyValue = .init(n)
    }
}

extension PropertyKey {
    public static var fontWeight: PropertyKey<FontWeightValue> { "font-weight".propertyKey() }
}

public struct FontWeightValue: CustomStringConvertible {
    public let value: String
    
    public init (_ type: FontWeightType) {
        value = type.value
    }
    
    public init (_ n: Int) {
        value = "\(n)"
    }
    
    public var description: String { value }
}
