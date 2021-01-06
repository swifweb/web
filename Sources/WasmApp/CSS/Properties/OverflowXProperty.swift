//
//  OverflowXProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area
///
/// ```html
/// overflow-x: scroll;
/// overflow-x: hidden;
/// overflow-x: auto;
/// overflow-x: visible;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_overflow-x.asp)
public class OverflowXProperty: _Property {
    public var propertyKey: PropertyKey<OverflowType> { .overflowX }
    public var propertyValue: OverflowType
    var _content = _PropertyContent<OverflowType>()
    
    public init (_ type: OverflowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var overflowX: PropertyKey<OverflowType> { "overflow-x".propertyKey() }
}
