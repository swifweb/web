//
//  ListStylePositionProperty.swift
//  Web
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
public class ListStylePositionProperty: _Property {
    public var propertyKey: PropertyKey<ListStylePositionType> { .listStylePosition }
    public var propertyValue: ListStylePositionType
    var _content = _PropertyContent<ListStylePositionType>()
    
    public init (_ type: ListStylePositionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ListStylePositionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ListStylePositionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the position of the list-item markers (bullet points)
    public static var listStylePosition: PropertyKey<ListStylePositionType> { "list-style-position".propertyKey() }
}

extension Stylesheet {
    /// Specifies the position of the list-item markers (bullet points)
    public typealias ListStylePosition = ListStylePositionProperty
}

extension CSSRulable {
    /// Specifies the position of the list-item markers (bullet points)
    public func listStylePosition(_ type: ListStylePositionType) -> Self {
        s?._addProperty(.listStylePosition, type)
        return self
    }

    /// Specifies the position of the list-item markers (bullet points)
    public func listStylePosition(_ type: State<ListStylePositionType>) -> Self {
        s?._addProperty(ListStylePositionProperty(type))
        return self
    }

    /// Specifies the position of the list-item markers (bullet points)
    public func listStylePosition<V>(_ type: ExpressableState<V, ListStylePositionType>) -> Self {
        listStylePosition(type.unwrap())
    }
}
