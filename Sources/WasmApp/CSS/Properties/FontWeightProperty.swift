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
    
    public init (_ type: FontWeightType) {
        propertyValue = .init(type)
    }
    
    public init <F>(_ type: F) where F: StateConvertible, F.Value == FontWeightType {
        propertyValue = .init(type)
    }
    
    public init (_ n: Int) {
        propertyValue = .init(n)
    }
    
    public init <V>(_ n: V) where V: StateConvertible, V.Value == Int {
        propertyValue = .init(n)
    }
}

extension PropertyKey {
    /// Specifies the weight of a font
    public static var fontWeight: PropertyKey<FontWeightValue> { "font-weight".propertyKey() }
}

public class FontWeightValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: FontWeightType) {
        value = type.value
    }
    
    public convenience init <F>(_ type: F) where F: StateConvertible, F.Value == FontWeightType {
        let type = type.stateValue
        self.init(type.wrappedValue)
        type.listen {
            self.value = type.wrappedValue.value
            self._changeHandler()
        }
    }
    
    public init (_ n: Int) {
        value = "\(n)"
    }
    
    public convenience init <V>(_ n: V) where V: StateConvertible, V.Value == Int {
        let n = n.stateValue
        self.init(n.wrappedValue)
        n.listen {
            self.value = "\($0)"
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies the weight of a font
    public typealias FontWeight = FontWeightProperty
}

extension CSSRulable {
    /// Specifies the weight of a font
    public func fontWeight(_ type: FontWeightType) -> Self {
        s?._addProperty(FontWeightProperty(type))
        return self
    }
    
    /// Specifies the weight of a font
    public func fontWeight<F>(_ type: F) -> Self where F: StateConvertible, F.Value == FontWeightType {
        s?._addProperty(FontWeightProperty(type))
        return self
    }
    
    /// Specifies the weight of a font
    public func fontWeight(_ n: Int) -> Self {
        s?._addProperty(FontWeightProperty(n))
        return self
    }
    
    /// Specifies the weight of a font
    public func fontWeight<V>(_ n: V) -> Self where V: StateConvertible, V.Value == Int {
        s?._addProperty(FontWeightProperty(n))
        return self
    }
}
