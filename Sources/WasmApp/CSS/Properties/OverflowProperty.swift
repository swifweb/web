//
//  Overflow.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies what happens if content overflows an element's box
///
/// ```html
/// overflow: scroll;
/// overflow: hidden;
/// overflow: auto;
/// overflow: visible;
/// ```
///
/// [Learn more](___)
public class OverflowProperty: _Property {
    public var propertyKey: PropertyKey<OverflowType> { .overflow }
    public var propertyValue: OverflowType
    var _content = _PropertyContent<OverflowType>()
    
    public init (_ type: OverflowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var overflow: PropertyKey<OverflowType> { "overflow".propertyKey() }
}
