//
//  ColumnRuleColorProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the color of the rule between columns
///
/// ```html
/// column-rule-color: #ff0000;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_column-rule-color.asp)
public class ColumnRuleColorProperty: _Property {
    public var propertyKey: PropertyKey<Color> { .columnRuleColor }
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
    /// Specifies the color of the rule between columns
    public static var columnRuleColor: PropertyKey<Color> { "column-rule-color".propertyKey() }
}

extension Stylesheet {
    /// Specifies the color of the rule between columns
    public typealias ColumnRuleColor = ColumnRuleColorProperty
}

extension CSSRulable {
    /// Specifies the color of the rule between columns
    public func columnRuleColor(_ type: Color) -> Self {
        s?._addProperty(.columnRuleColor, type)
        return self
    }

    /// Specifies the color of the rule between columns
    public func columnRuleColor(_ type: State<Color>) -> Self {
        s?._addProperty(ColumnRuleColorProperty(type))
        return self
    }

    /// Specifies the color of the rule between columns
    public func columnRuleColor<V>(_ type: ExpressableState<V, Color>) -> Self {
        columnRuleColor(type.unwrap())
    }
}
