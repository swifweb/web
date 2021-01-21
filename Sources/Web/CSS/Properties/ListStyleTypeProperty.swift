//
//  ListStyleTypeProperty.swift
//  Web
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
    
    public convenience init (_ type: State<ListStyleTypeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ListStyleTypeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the type of list-item marker
    public static var listStyleType: PropertyKey<ListStyleTypeType> { "list-style-type".propertyKey() }
}

extension Stylesheet {
    /// Specifies the type of list-item marker
    public typealias ListStyleType = ListStyleTypeProperty
}

extension CSSRulable {
    /// Specifies the type of list-item marker
    public func listStyleType(_ type: ListStyleTypeType) -> Self {
        s?._addProperty(.listStyleType, type)
        return self
    }

    /// Specifies the type of list-item marker
    public func listStyleType(_ type: State<ListStyleTypeType>) -> Self {
        s?._addProperty(ListStyleTypeProperty(type))
        return self
    }

    /// Specifies the type of list-item marker
    public func listStyleType<V>(_ type: ExpressableState<V, ListStyleTypeType>) -> Self {
        listStyleType(type.unwrap())
    }
}
