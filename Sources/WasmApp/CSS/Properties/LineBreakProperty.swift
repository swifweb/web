//
//  LineBreak.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies how/if to break lines
///
/// ```html
/// line-break: auto;
/// line-break: loose;
/// line-break: normal;
/// line-break: strict;
/// line-break: anywhere;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/line-break)
public class LineBreakProperty: _Property {
    public var propertyKey: PropertyKey<LineBreakType> { .lineBreak }
    public var propertyValue: LineBreakType
    var _content = _PropertyContent<LineBreakType>()
    
    public init (_ type: LineBreakType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var lineBreak: PropertyKey<LineBreakType> { "line-break".propertyKey() }
}
