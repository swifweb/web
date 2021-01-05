//
//  Clear.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies on which sides of an element floating elements are not allowed to float
///
/// ```html
/// clear: both;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_clear.asp)
public class ClearProperty: _Property {
    public var propertyKey: PropertyKey<ClearType> { .clear }
    public var propertyValue: ClearType
    var _content = _PropertyContent<ClearType>()
    
    public init (_ type: ClearType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var clear: PropertyKey<ClearType> { "clear".propertyKey() }
}
