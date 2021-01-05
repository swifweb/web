//
//  Filter.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Defines effects (e.g. blurring or color shifting) on an element before the element is displayed
///
/// ```html
/// filter: grayscale(100%);
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_filter.asp)
public class FilterProperty: _Property {
    public var propertyKey: PropertyKey<FilterType> { .filter }
    public var propertyValue: FilterType
    var _content = _PropertyContent<FilterType>()
    
    public init (_ type: FilterType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var filter: PropertyKey<FilterType> { "filter".propertyKey() }
}
