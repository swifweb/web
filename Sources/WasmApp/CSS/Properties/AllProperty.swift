//
//  All.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Resets all properties (except unicode-bidi and direction)
///
/// ```html
/// all: initial;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_all.asp)
public class AllProperty: _Property {
    public var propertyKey: PropertyKey<AllType> { .all }
    public var propertyValue: AllType
    var _content = _PropertyContent<AllType>()
    
    public init (_ type: AllType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var all: PropertyKey<AllType> { "all".propertyKey() }
}
