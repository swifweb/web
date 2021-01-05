//
//  Visibility.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies whether or not an element is visible
///
/// ```html
/// h2.a {
///     visibility: visible;
/// }
///
/// h2.b {
///     visibility: hidden;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_visibility.asp)
public class VisibilityProperty: _Property {
    public var propertyKey: PropertyKey<VisibilityType> { .visibility }
    public var propertyValue: VisibilityType
    var _content = _PropertyContent<VisibilityType>()
    
    public init (_ type: VisibilityType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var visibility: PropertyKey<VisibilityType> { "visibility".propertyKey() }
}
