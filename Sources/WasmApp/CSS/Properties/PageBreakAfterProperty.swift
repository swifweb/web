//
//  PageBreakAfter.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var pageBreakAfter: PropertyKey<PageBreakAfterType> { "page-break-after".propertyKey() }
}
