//
//  TextDecoration.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the decoration added to text
///
/// ```html
/// h1 {
///     text-decoration: overline;
/// }
///
/// h2 {
///     text-decoration: line-through;
/// }
///
/// h3 {
///     text-decoration: underline;
/// }
///
/// h4 {
///     text-decoration: underline overline;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_text-decoration.asp)
public class TextDecorationProperty: _Property {
    public var propertyKey: PropertyKey<TextDecorationValue> { .textDecoration }
    public var propertyValue: TextDecorationValue
    var _content = _PropertyContent<TextDecorationValue>()
    
    public init (_ line: TextDecorationLineType, _ color: Color, _ style: TextDecorationStyleType) {
        propertyValue = TextDecorationValue(line, color, style)
    }
}

extension PropertyKey {
    public static var textDecoration: PropertyKey<TextDecorationValue> { "text-decoration".propertyKey() }
}

public struct TextDecorationValue: CustomStringConvertible {
    let line: TextDecorationLineType
    let color: Color
    let style: TextDecorationStyleType
    
    public init (_ line: TextDecorationLineType, _ color: Color, _ style: TextDecorationStyleType) {
        self.line = line
        self.color = color
        self.style = style
    }
    
    public var description: String {
        [line.value, color.description, style.value].joined(separator: " ")
    }
}

extension Stylesheet {
    /// Specifies the decoration added to text
    public typealias TextDecoration = TextDecorationProperty
}

extension CSSRulable {
    /// Specifies the decoration added to text
    public func textDecoration(_ line: TextDecorationLineType, _ color: Color, _ style: TextDecorationStyleType) -> Self {
        s?._addProperty(TextDecorationProperty(line, color, style))
        return self
    }
    
    /// Specifies the decoration added to text
    public func textDecoration(_ line: TextDecorationLineType, _ color: Int, _ style: TextDecorationStyleType) -> Self {
        s?._addProperty(TextDecorationProperty(line, .hex(color), style))
        return self
    }
}
