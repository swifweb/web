//
//  ScrollBehavior.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies whether to smoothly animate the scroll position in a scrollable box, instead of a straight jump
///
/// ```html
/// html {
///     scroll-behavior: smooth;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_scroll-behavior.asp)
public class ScrollBehaviorProperty: _Property {
    public var propertyKey: PropertyKey<ScrollBehaviorType> { .scrollBehavior }
    public var propertyValue: ScrollBehaviorType
    var _content = _PropertyContent<ScrollBehaviorType>()
    
    public init (_ type: ScrollBehaviorType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var scrollBehavior: PropertyKey<ScrollBehaviorType> { "scroll-behavior".propertyKey() }
}
