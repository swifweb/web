//
//  PageBreakBefore.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the page-break behavior before an element
///
/// ```html
/// page-break-before: always;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_print_pagebb.asp)
public class PageBreakBeforeProperty: _Property {
    public var propertyKey: PropertyKey<PageBreakBeforeType> { .pageBreakBefore }
    public var propertyValue: PageBreakBeforeType
    var _content = _PropertyContent<PageBreakBeforeType>()
    
    public init (_ type: PageBreakBeforeType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<PageBreakBeforeType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, PageBreakBeforeType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the page-break behavior before an element
    public static var pageBreakBefore: PropertyKey<PageBreakBeforeType> { "page-break-before".propertyKey() }
}

extension Stylesheet {
    /// Sets the page-break behavior before an element
    public typealias PageBreakBefore = PageBreakBeforeProperty
}

extension CSSRulable {
    /// Sets the page-break behavior before an element
    public func pageBreakBefore(_ type: PageBreakBeforeType) -> Self {
        s?._addProperty(.pageBreakBefore, type)
        return self
    }

    /// Sets the page-break behavior before an element
    public func pageBreakBefore(_ type: State<PageBreakBeforeType>) -> Self {
        s?._addProperty(PageBreakBeforeProperty(type))
        return self
    }

    /// Sets the page-break behavior before an element
    public func pageBreakBefore<V>(_ type: ExpressableState<V, PageBreakBeforeType>) -> Self {
        pageBreakBefore(type.unwrap())
    }
}
