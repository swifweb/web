//
//  BreakInside.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies whether or not a page-, column-, or region-break should occur inside the specified element
///
/// ```html
/// break-inside: avoid;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_break-inside.asp)
public class BreakInsideProperty: _Property {
    public var propertyKey: PropertyKey<BreakInsideType> { .breakInside }
    public var propertyValue: BreakInsideType
    var _content = _PropertyContent<BreakInsideType>()
    
    public init (_ type: BreakInsideType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var breakInside: PropertyKey<BreakInsideType> { "break-inside".propertyKey() }
}
