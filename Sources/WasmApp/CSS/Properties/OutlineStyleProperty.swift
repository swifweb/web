//
//  OutlineStyleProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the style of an outline
///
/// ```html
/// outline-style: dotted;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-style.asp)
public class OutlineStyleProperty: _Property {
    public var propertyKey: PropertyKey<OutlineStyleType> { .outlineStyle }
    public var propertyValue: OutlineStyleType
    var _content = _PropertyContent<OutlineStyleType>()
    
    public init (_ type: OutlineStyleType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var outlineStyle: PropertyKey<OutlineStyleType> { "outline-style".propertyKey() }
}
