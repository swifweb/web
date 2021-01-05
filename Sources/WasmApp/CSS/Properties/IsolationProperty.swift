//
//  Isolation.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Defines whether an element must create a new stacking content
///
/// ```html
/// isolation: isolate;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_isolation.asp)
public class IsolationProperty: _Property {
    public var propertyKey: PropertyKey<IsolationType> { .isolation }
    public var propertyValue: IsolationType
    var _content = _PropertyContent<IsolationType>()
    
    public init (_ type: IsolationType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var isolation: PropertyKey<IsolationType> { "isolation".propertyKey() }
}
