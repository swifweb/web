//
//  TextDecorationColor.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the color of the text-decoration
///
/// ```html
/// p {
///     text-decoration: underline;
///     text-decoration-color: red;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-decoration-color.asp)
public class TextDecorationColorProperty: _Property {
    public var propertyKey: PropertyKey<Color> { .textDecorationColor }
    public var propertyValue: Color
    var _content = _PropertyContent<Color>()
    
    public init (_ color: Color) {
        propertyValue = color
    }
    
    public convenience init (_ color: State<Color>) {
        self.init(color.wrappedValue)
        color.listen {
            self.propertyValue = $0
            self._content._changeHandler($0)
        }
    }
    
    public convenience init<V>(_ color: ExpressableState<V, Color>) {
        self.init(color.unwrap())
    }
    
    public convenience init(_ hex: Int) {
        self.init(.hex(hex))
    }
    
    public convenience init(_ hex: State<Int>) {
        self.init(hex.wrappedValue)
        hex.listen { self.propertyValue = .hex($0) }
    }
    
    public convenience init<V>(_ hex: ExpressableState<V, Int>) {
        self.init(hex.unwrap())
    }
    
    public convenience init (r: Int, g: Int, b: Int, a: Double) {
        self.init(.rgba(r: r, g: g, b: b, a: a))
    }
    
    public convenience init (r: Int, g: Int, b: Int) {
        self.init(r: r, g:g, b: b, a: 1)
    }
    
    public convenience init (h: Int, s: Int, l: Int, a: Double) {
        self.init(.hsla(h: h, s: s, l: l, a: a))
    }
    
    public convenience init (h: Int, s: Int, l: Int) {
        self.init(h: h, s: s, l: l, a: 1)
    }
}

extension PropertyKey {
    /// Specifies the color of the text-decoration
    public static var textDecorationColor: PropertyKey<Color> { "text-decoration-color".propertyKey() }
}

extension Stylesheet {
    /// Specifies the color of the text-decoration
    public typealias TextDecorationColor = TextDecorationColorProperty
}

extension CSSRulable {
    /// Specifies the color of the text-decoration
    public func textDecorationColor(_ type: Color) -> Self {
        s?._addProperty(.textDecorationColor, type)
        return self
    }

    /// Specifies the color of the text-decoration
    public func textDecorationColor<S>(_ type: S) -> Self where S: StateConvertible, S.Value == Color {
        s?._addProperty(TextDecorationColorProperty(type.stateValue))
        return self
    }
    
    /// Specifies the color of the text-decoration
    public func textDecorationColor(_ type: Int) -> Self {
        textDecorationColor(.hex(type))
    }

    /// Specifies the color of the text-decoration
    public func textDecorationColor<S>(_ type: S) -> Self where S: StateConvertible, S.Value == Int {
        textDecorationColor(type.stateValue.map { .hex($0) })
    }
}
