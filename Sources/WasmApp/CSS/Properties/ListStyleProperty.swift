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
