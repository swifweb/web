//
//  TextDecoration.swift
//  SwifCSS
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
    
    public init (_ line: TextDecorationLineType, _ color: TextDecorationColorType, _ style: TextDecorationStyleType) {
        propertyValue = TextDecorationValue(line, color, style)
    }
}

extension PropertyKey {
    public static var textDecoration: PropertyKey<TextDecorationValue> { "text-decoration".propertyKey() }
}

public struct TextDecorationValue: CustomStringConvertible {
    let line: TextDecorationLineType
    let color: TextDecorationColorType
    let style: TextDecorationStyleType
    
    public init (_ line: TextDecorationLineType, _ color: TextDecorationColorType, _ style: TextDecorationStyleType) {
        self.line = line
        self.color = color
        self.style = style
    }
    
    public var description: String {
        [line.value, color.value, style.value].joined(separator: " ")
    }
}
