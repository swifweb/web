//
//  Widows.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the minimum number of lines that must be left at the top of a page when a page break occurs inside an element
public class WidowsProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .widows }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ value: Int) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var widows: PropertyKey<Int> { "widows".propertyKey() }
}
