//
//  ListStyleImageProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies an image as the list-item marker
///
/// ```html
/// ul {
///     list-style-image: url('sqpurple.gif');
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_list-style-image.asp)
public class ListStyleImageProperty: Property {
    public var propertyKey: PropertyKey<URLValueContainer> { .listStyleImage }
    public var propertyValue: URLValueContainer
    
    public init (_ v: URLValue) {
        propertyValue = URLValueContainer(v)
    }
}

extension PropertyKey {
    public static var listStyleImage: PropertyKey<URLValueContainer> { "list-style-image".propertyKey() }
}
