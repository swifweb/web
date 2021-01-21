//
//  BackgroundColorProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the background color of an element
///
/// ```html
/// background-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-color.asp)
public class BackgroundColorProperty: _Property {
    public var propertyKey: PropertyKey<Color> { .backgroundColor }
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
    /// Specifies the background color of an element
    public static var backgroundColor: PropertyKey<Color> { "background-color".propertyKey() }
}

extension Stylesheet {
    /// Specifies the background color of an element
    public typealias BackgroundColor = BackgroundColorProperty
}

extension CSSRulable {
    /// Specifies the background color of an element
    public func backgroundColor(_ type: Color) -> Self {
        s?._addProperty(.backgroundColor, type)
        return self
    }

    /// Specifies the background color of an element
    public func backgroundColor(_ type: State<Color>) -> Self {
        s?._addProperty(BackgroundColorProperty(type))
        return self
    }

    /// Specifies the background color of an element
    public func backgroundColor<V>(_ type: ExpressableState<V, Color>) -> Self {
        backgroundColor(type.unwrap())
    }
}
