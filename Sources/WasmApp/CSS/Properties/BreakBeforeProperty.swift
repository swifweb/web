//
//  BreakBefore.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a page-, column-, or region-break should occur before the specified element
///
/// ```html
/// break-before: always;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_break-before.asp)
public class BreakBeforeProperty: _Property {
    public var propertyKey: PropertyKey<BreakType> { .breakBefore }
    public var propertyValue: BreakType
    var _content = _PropertyContent<BreakType>()
    
    public init (_ type: BreakType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var breakBefore: PropertyKey<BreakType> { "break-before".propertyKey() }
}
