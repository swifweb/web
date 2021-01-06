//
//  ListStyleTypeProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the type of list-item marker
///
/// ```html
/// ul.a { list-style-type: circle; }
/// ul.b { list-style-type: square; }
/// ol.c { list-style-type: upper-roman; }
/// ol.d { list-style-type: lower-alpha; }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_list-style-type.asp)
public class ListStyleTypeProperty: _Property {
    public var propertyKey: PropertyKey<ListStyleTypeType> { .listStyleType }
    public var propertyValue: ListStyleTypeType
    var _content = _PropertyContent<ListStyleTypeType>()
    
    public init (_ type: ListStyleTypeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var listStyleType: PropertyKey<ListStyleTypeType> { "list-style-type".propertyKey() }
}
