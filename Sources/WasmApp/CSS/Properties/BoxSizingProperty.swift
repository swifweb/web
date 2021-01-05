//
//  BoxSizing.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Defines how the width and height of an element are calculated: should they include padding and borders, or not
///
/// ```html
/// box-sizing: border-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_box-sizing.asp)
public class BoxSizingProperty: _Property {
    public var propertyKey: PropertyKey<BoxSizingType> { .boxSizing }
    public var propertyValue: BoxSizingType
    var _content = _PropertyContent<BoxSizingType>()
    
    public init (_ type: BoxSizingType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var boxSizing: PropertyKey<BoxSizingType> { "box-sizing".propertyKey() }
}
