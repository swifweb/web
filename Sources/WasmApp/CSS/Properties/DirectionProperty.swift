//
//  Direction.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the text direction/writing direction
///
/// ```html
/// direction: rtl;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_direction.asp)
public class DirectionProperty: _Property {
    public var propertyKey: PropertyKey<DirectionType> { .direction }
    public var propertyValue: DirectionType
    var _content = _PropertyContent<DirectionType>()
    
    public init (_ type: DirectionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var direction: PropertyKey<DirectionType> { "direction".propertyKey() }
}
