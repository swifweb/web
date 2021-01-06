//
//  ListStyle.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets all the properties for a list in one declaration
///
/// ```html
/// ul {
///     list-style: square inside url("sqpurple.gif");
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_list-style.asp)
public class ListStyleProperty: Property {
    public var propertyKey: PropertyKey<ListStyleValue> { .listStyle }
    public var propertyValue: ListStyleValue
    
    public init (_ value: ListStyleValue) {
        propertyValue = value
    }
    
    public init (_ type: ListStyleTypeType, _ position: ListStylePositionType, _ url: URLValue) {
        propertyValue = ListStyleValue(type, position, url)
    }
}

extension PropertyKey {
    public static var listStyle: PropertyKey<ListStyleValue> { "list-style".propertyKey() }
}

public struct ListStyleValue: CustomStringConvertible {
    let value: String
    
    public init (_ type: ListStyleTypeType, _ position: ListStylePositionType, _ url: URLValue) {
        value = [type.value, position.value, url.urlValue].joined(separator: " ")
    }
    
    public var description: String { value }
}
