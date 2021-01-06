//
//  ListStylePositionProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the position of the list-item markers (bullet points)
///
/// ```html
/// list-style-position: outside;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_list-style-position.asp)
public class ListStylePositionProperty: Property {
    public var propertyKey: PropertyKey<ListStylePositionType> { .listStylePosition }
    public var propertyValue: ListStylePositionType
    
    public init (_ type: ListStylePositionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var listStylePosition: PropertyKey<ListStylePositionType> { "list-style-position".propertyKey() }
}
