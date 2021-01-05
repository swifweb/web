//
//  LineHeight.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the line height
///
/// ```html
/// line-height: normal;
/// line-height: 1.6;
/// line-height: 80%;
/// line-height: 200%;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_dim_line-height.asp)
public class LineHeightProperty: _Property {
    public var propertyKey: PropertyKey<LineHeightType> { .lineHeight }
    public var propertyValue: LineHeightType
    var _content = _PropertyContent<LineHeightType>()
    
    public init (_ type: LineHeightType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var lineHeight: PropertyKey<LineHeightType> { "line-height".propertyKey() }
}
