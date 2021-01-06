//
//  PageBreakInside.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets the page-break behavior inside an element
///
/// ```html
/// page-break-inside: avoid;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_print_pagebi.asp)
public class PageBreakInsideProperty: _Property {
    public var propertyKey: PropertyKey<PageBreakInsideType> { .pageBreakInside }
    public var propertyValue: PageBreakInsideType
    var _content = _PropertyContent<PageBreakInsideType>()
    
    public init (_ type: PageBreakInsideType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<PageBreakInsideType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, PageBreakInsideType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets the page-break behavior inside an element
    public static var pageBreakInside: PropertyKey<PageBreakInsideType> { "page-break-inside".propertyKey() }
}

extension Stylesheet {
    /// Sets the page-break behavior inside an element
    public typealias PageBreakInside = PageBreakInsideProperty
}

extension CSSRulable {
    /// Sets the page-break behavior inside an element
    public func pageBreakInside(_ type: PageBreakInsideType) -> Self {
        s?._addProperty(.pageBreakInside, type)
        return self
    }

    /// Sets the page-break behavior inside an element
    public func pageBreakInside(_ type: State<PageBreakInsideType>) -> Self {
        s?._addProperty(PageBreakInsideProperty(type))
        return self
    }

    /// Sets the page-break behavior inside an element
    public func pageBreakInside<V>(_ type: ExpressableState<V, PageBreakInsideType>) -> Self {
        pageBreakInside(type.unwrap())
    }
}
