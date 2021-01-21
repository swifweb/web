//
//  ListStyle.swift
//  Web
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
public class ListStyleProperty: _Property {
    public var propertyKey: PropertyKey<ListStyleValue> { .listStyle }
    public var propertyValue: ListStyleValue
    var _content = _PropertyContent<ListStyleValue>()
    
    public init (_ type: ListStyleTypeType, _ position: ListStylePositionType, _ url: URLValue) {
        propertyValue = ListStyleValue(type, position, url)
    }
}

extension PropertyKey {
    /// Sets all the properties for a list in one declaration
    public static var listStyle: PropertyKey<ListStyleValue> { "list-style".propertyKey() }
}

public struct ListStyleValue: CustomStringConvertible {
    let value: String
    
    public init (_ type: ListStyleTypeType, _ position: ListStylePositionType, _ url: URLValue) {
        value = [type.value, position.value, url.urlValue].joined(separator: " ")
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Sets all the properties for a list in one declaration
    public typealias ListStyle = ListStyleProperty
}

extension CSSRulable {
    /// Sets all the properties for a list in one declaration
    public func listStyle(_ type: ListStyleTypeType, _ position: ListStylePositionType, _ url: URLValue) -> Self {
        s?._addProperty(ListStyleProperty(type, position, url))
        return self
    }
}
