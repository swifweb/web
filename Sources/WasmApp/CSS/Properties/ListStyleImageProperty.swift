//
//  ListStyleImageProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

import Foundation

/// Specifies an image as the list-item marker
///
/// ```html
/// ul {
///     list-style-image: url('sqpurple.gif');
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_list-style-image.asp)
public class ListStyleImageProperty: _Property {
    public var propertyKey: PropertyKey<URLValueContainer> { .listStyleImage }
    public var propertyValue: URLValueContainer
    var _content = _PropertyContent<URLValueContainer>()
    
    public init (_ v: URLValue) {
        propertyValue = URLValueContainer(v)
    }
    
    public convenience init (_ type: State<URLValue>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: .init($0)) }
    }
    
    public convenience init (_ type: State<String>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: .init($0)) }
    }
    
    public convenience init (_ type: State<URL>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: .init($0)) }
    }
    
    public convenience init <V>(_ type: ExpressableState<V, URLValue>) {
        self.init(type.unwrap())
    }
    
    public convenience init <V>(_ type: ExpressableState<V, String>) {
        self.init(type.unwrap())
    }
    
    public convenience init <V>(_ type: ExpressableState<V, URL>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies an image as the list-item marker
    public static var listStyleImage: PropertyKey<URLValueContainer> { "list-style-image".propertyKey() }
}

extension Stylesheet {
    /// Specifies an image as the list-item marker
    public typealias ListStyleImage = ListStyleImageProperty
}

extension CSSRulable {
    /// Specifies an image as the list-item marker
    public func listStyleImage(_ type: URLValue) -> Self {
        s?._addProperty(.listStyleImage, URLValueContainer(type))
        return self
    }
    
    /// Specifies an image as the list-item marker
    public func listStyleImage(_ type: State<URLValue>) -> Self {
        s?._addProperty(ListStyleImageProperty(type))
        return self
    }
    
    /// Specifies an image as the list-item marker
    public func listStyleImage(_ type: State<String>) -> Self {
        s?._addProperty(ListStyleImageProperty(type))
        return self
    }
    
    /// Specifies an image as the list-item marker
    public func listStyleImage(_ type: State<URL>) -> Self {
        s?._addProperty(ListStyleImageProperty(type))
        return self
    }
    
    /// Specifies an image as the list-item marker
    public func listStyleImage<V>(_ type: ExpressableState<V, URLValue>) -> Self {
        listStyleImage(type.unwrap())
    }
    
    /// Specifies an image as the list-item marker
    public func listStyleImage<V>(_ type: ExpressableState<V, String>) -> Self {
        listStyleImage(type.unwrap())
    }
    
    /// Specifies an image as the list-item marker
    public func listStyleImage<V>(_ type: ExpressableState<V, URL>) -> Self {
        listStyleImage(type.unwrap())
    }
}
