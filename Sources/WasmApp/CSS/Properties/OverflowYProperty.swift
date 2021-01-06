//
//  OverflowYProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area
///
/// ```html
/// overflow-y: scroll;
/// overflow-y: hidden;
/// overflow-y: auto;
/// overflow-y: visible;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_overflow-y.asp)
public class OverflowYProperty: _Property {
    public var propertyKey: PropertyKey<OverflowType> { .overflowY }
    public var propertyValue: OverflowType
    var _content = _PropertyContent<OverflowType>()
    
    public init (_ type: OverflowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var overflowY: PropertyKey<OverflowType> { "overflow-y".propertyKey() }
}
