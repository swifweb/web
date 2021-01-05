//
//  PageBreakBefore.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var pageBreakBefore: PropertyKey<PageBreakBeforeType> { "page-break-before".propertyKey() }
}
