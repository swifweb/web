//
//  FontSizeAdjust.swift
//  Web
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
    
    public init (_ type: FontSizeAdjustType) {
        propertyValue = .init(type)
    }
    
    public convenience init <T>(_ type: T) where T: StateConvertible, T.Value == FontSizeAdjustType {
        let type = type.stateValue
        self.init(type.wrappedValue)
        type.listen {
            self._changed(to: .init($0))
        }
    }
    
    public init (_ numeric: NumericValue) {
        propertyValue = .init(numeric)
    }
    
    public convenience init <T>(_ numeric: T) where T: StateConvertible, T.Value == NumericValue {
        let numeric = numeric.stateValue
        self.init(numeric.wrappedValue)
        numeric.listen {
            self._changed(to: .init($0))
        }
    }
}

extension PropertyKey {
    /// Preserves the readability of text when font fallback occurs
    public static var fontSizeAdjust: PropertyKey<FontSizeAdjustValue> { "font-size-adjust".propertyKey() }
}

public class FontSizeAdjustValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ type: FontSizeAdjustType) {
        value = type.value
    }
    
    public convenience init <T>(_ type: T) where T: StateConvertible, T.Value == FontSizeAdjustType {
        let type = type.stateValue
        self.init(type.wrappedValue)
        type.listen {
            self.value = $0.value
            self._changeHandler()
        }
    }
    
    public init (_ numeric: NumericValue) {
        value = numeric.numericValue
    }
    
    public convenience init <T>(_ numeric: T) where T: StateConvertible, T.Value == NumericValue {
        let numeric = numeric.stateValue
        self.init(numeric.wrappedValue)
        numeric.listen {
            self.value = $0.numericValue
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Preserves the readability of text when font fallback occurs
    public typealias FontSizeAdjust = FontSizeAdjustProperty
}

extension CSSRulable {
    /// Preserves the readability of text when font fallback occurs
    public func fontSizeAdjust(_ type: FontSizeAdjustType) -> Self {
        s?._addProperty(FontSizeAdjustProperty(type))
        return self
    }
    
    /// Preserves the readability of text when font fallback occurs
    public func fontSizeAdjust<T>(_ type: T) -> Self where T: StateConvertible, T.Value == FontSizeAdjustType {
        s?._addProperty(FontSizeAdjustProperty(type))
        return self
    }
    
    /// Preserves the readability of text when font fallback occurs
    public func fontSizeAdjust(_ numeric: NumericValue) -> Self {
        s?._addProperty(FontSizeAdjustProperty(numeric))
        return self
    }
    
    /// Preserves the readability of text when font fallback occurs
    public func fontSizeAdjust<T>(_ numeric: T) -> Self where T: StateConvertible, T.Value == NumericValue {
        s?._addProperty(FontSizeAdjustProperty(numeric))
        return self
    }
}
