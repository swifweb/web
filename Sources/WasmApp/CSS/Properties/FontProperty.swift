//
//  Font.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for the font-style, font-variant, font-weight, font-size/line-height, and the font-family properties
///
/// ```html
/// font: 15px Arial, sans-serif;
/// font: italic small-caps bold 12px/30px Georgia, serif;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_font_font.asp)
public class FontProperty: _Property {
    public var propertyKey: PropertyKey<FontValue> { .font }
    public var propertyValue: FontValue
    var _content = _PropertyContent<FontValue>()
    
    public init (_ type: FontType) {
        propertyValue = .init(type)
    }
    
    public convenience init <T>(_ type: T) where T: StateConvertible, T.Value == FontType {
        let type = type.stateValue
        self.init(type.wrappedValue)
        type.listen {
            self._changed(to: .init($0))
        }
    }
    
    public init <F: UnitValuable, L: UnitValuable>(
        style: FontStyleType? = nil,
        variant: FontVariantType? = nil,
        weight: FontWeightType? = nil,
        fontSize: F? = nil,
        lineHeight: L? = nil,
        fontFamily: [FontFamilyType]? = nil) {
        propertyValue = .init(style: style, variant: variant, weight: weight, fontSize: fontSize, lineHeight: lineHeight, fontFamily: fontFamily)
    }
}

extension PropertyKey {
    /// A shorthand property for the font-style, font-variant, font-weight, font-size/line-height, and the font-family properties
    public static var font: PropertyKey<FontValue> { "font".propertyKey() }
}

public class FontValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: FontType) {
        value = type.value
    }
    
    public convenience init <T>(_ type: T) where T: StateConvertible, T.Value == FontType {
        let type = type.stateValue
        self.init(type.wrappedValue)
        type.listen {
            self.value = $0.value
            self._changeHandler()
        }
    }
    
    public init <F: UnitValuable, L: UnitValuable>(
        style: FontStyleType? = nil,
        variant: FontVariantType? = nil,
        weight: FontWeightType? = nil,
        fontSize: F? = nil,
        lineHeight: L? = nil,
        fontFamily: [FontFamilyType]? = nil) {
        var value = ""
        if let style = style {
            value = style.value
        }
        if let variant = variant {
            if value.count > 0 {
                value += " "
            }
            value += variant.value
        }
        if let weight = weight {
            if value.count > 0 {
                value += " "
            }
            value += weight.value
        }
        if let fontSize = fontSize {
            if value.count > 0 {
                value += " "
            }
            value += fontSize.description
            if let lineHeight = lineHeight {
                value += "/" + lineHeight.description
            }
        }
        if let fontFamily = fontFamily, fontFamily.count > 0 {
            if value.count > 0 {
                value += " "
            }
            value = fontFamily.map { $0.value }.joined(separator: ", ")
        }
        self.value = value
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for the font-style, font-variant, font-weight, font-size/line-height, and the font-family properties
    public typealias Font = FontProperty
}

extension CSSRulable {
    /// A shorthand property for the font-style, font-variant, font-weight, font-size/line-height, and the font-family properties
    public func font(_ type: FontType) -> Self {
        s?._addProperty(FontProperty(type))
        return self
    }
    
    /// A shorthand property for the font-style, font-variant, font-weight, font-size/line-height, and the font-family properties
    public func font<T>(_ type: T) -> Self where T: StateConvertible, T.Value == FontType {
        s?._addProperty(FontProperty(type))
        return self
    }
    
    /// A shorthand property for the font-style, font-variant, font-weight, font-size/line-height, and the font-family properties
    public func font<F: UnitValuable, L: UnitValuable>(
        style: FontStyleType? = nil,
        variant: FontVariantType? = nil,
        weight: FontWeightType? = nil,
        fontSize: F? = nil,
        lineHeight: L? = nil,
        fontFamily: [FontFamilyType]? = nil) -> Self {
        s?._addProperty(FontProperty(style: style, variant: variant, weight: weight, fontSize: fontSize, lineHeight: lineHeight, fontFamily: fontFamily))
        return self
    }
}
