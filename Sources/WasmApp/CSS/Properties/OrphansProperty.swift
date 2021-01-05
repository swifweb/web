//
//  Orphans.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the minimum number of lines that must be left at the bottom of a page when a page break occurs inside an element
///
/// ```html
/// orphans: 2;
/// orphans: 3;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/orphans)
public class OrphansProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .orphans }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ v: Int) {
        propertyValue = v
    }
}

extension PropertyKey {
    public static var orphans: PropertyKey<Int> { "orphans".propertyKey() }
}
