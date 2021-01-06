//
//  OutlineWidthProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the width of an outline
///
/// ```html
/// outline-width: thick;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_outline-width.asp)
public class OutlineWidthProperty: _Property {
    public var propertyKey: PropertyKey<OutlineWidthType> { .outlineWidth }
    public var propertyValue: OutlineWidthType
    var _content = _PropertyContent<OutlineWidthType>()
    
    public init (_ type: OutlineWidthType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var outlineWidth: PropertyKey<OutlineWidthType> { "outline-width".propertyKey() }
}
