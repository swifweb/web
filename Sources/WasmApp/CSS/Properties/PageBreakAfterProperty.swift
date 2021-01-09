//
//  PageBreakAfter.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the page-break behavior after an element
///
/// ```html
/// page-break-after: always;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_print_pageba.asp)
public class PageBreakAfterProperty: _Property {
    public var propertyKey: PropertyKey<PageBreakAfterType> { .pageBreakAfter }
    public var propertyValue: PageBreakAfterType
    var _content = _PropertyContent<PageBreakAfterType>()
    
    public init (_ type: PageBreakAfterType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<PageBreakAfterType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, PageBreakAfterType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the page-break behavior after an element
    public static var pageBreakAfter: PropertyKey<PageBreakAfterType> { "page-break-after".propertyKey() }
}

extension Stylesheet {
    /// Sets the page-break behavior after an element
    public typealias PageBreakAfter = PageBreakAfterProperty
}

extension CSSRulable {
    /// Sets the page-break behavior after an element
    public func pageBreakAfter(_ type: PageBreakAfterType) -> Self {
        s?._addProperty(.pageBreakAfter, type)
        return self
    }

    /// Sets the page-break behavior after an element
    public func pageBreakAfter(_ type: State<PageBreakAfterType>) -> Self {
        s?._addProperty(PageBreakAfterProperty(type))
        return self
    }

    /// Sets the page-break behavior after an element
    public func pageBreakAfter<V>(_ type: ExpressableState<V, PageBreakAfterType>) -> Self {
        pageBreakAfter(type.unwrap())
    }
}
