//
//  BreakAfter.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a page-, column-, or region-break should occur after the specified element
///
/// ```html
/// break-after: always;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_break-after.asp)
public class BreakAfterProperty: _Property {
    public var propertyKey: PropertyKey<BreakType> { .breakAfter }
    public var propertyValue: BreakType
    var _content = _PropertyContent<BreakType>()
    
    public init (_ type: BreakType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var breakAfter: PropertyKey<BreakType> { "break-after".propertyKey() }
}
