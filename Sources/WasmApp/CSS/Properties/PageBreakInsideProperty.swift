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
}

extension PropertyKey {
    public static var pageBreakInside: PropertyKey<PageBreakInsideType> { "page-break-inside".propertyKey() }
}
