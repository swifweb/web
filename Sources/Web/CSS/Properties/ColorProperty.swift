//
//  Color.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Sets the color of text
///
/// ```html
/// color: red;
/// color: #00ff00;
/// color: rgb(0,0,255);
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_color.asp)
public class ColorProperty: _Property {
    public var propertyKey: PropertyKey<Color> { .color }
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
    /// Sets the color of text
    public static var color: PropertyKey<Color> { "color".propertyKey() }
}

extension Stylesheet {
    /// Sets the color of text
    public typealias Color = ColorProperty
}

extension CSSRulable {
    /// Sets the color of text
    public func color(_ color: Color) -> Self {
        s?._addProperty(.color, color)
        return self
    }
    
    /// Sets the color of text
    public func color<S>(_ color: S) -> Self where S: StateConvertible, S.Value == Color {
        s?._addProperty(ColorProperty(color.stateValue))
        return self
    }
    
    /// Sets the color of text
    public func color(_ color: Int) -> Self {
        self.color(.hex(color))
    }
    
    /// Sets the color of text
    public func color<S>(_ color: S) -> Self where S: StateConvertible, S.Value == Int {
        self.color(color.stateValue.map { .hex($0) })
    }
}
