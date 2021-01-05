//
//  Display.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies how a certain HTML element should be displayed
///
/// ```html
/// display: block;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_display.asp)
public class DisplayProperty: _Property {
    public var propertyKey: PropertyKey<DisplayType> { .display }
    public var propertyValue: DisplayType
    var _content = _PropertyContent<DisplayType>()
    
    public init (_ type: DisplayType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var display: PropertyKey<DisplayType> { "display".propertyKey() }
}
