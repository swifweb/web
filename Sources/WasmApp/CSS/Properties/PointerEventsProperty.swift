//
//  PointerEvents.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Defines whether or not an element reacts to pointer events
///
/// ```html
/// div.ex1 {
///     pointer-events: none;
/// }
///
/// div.ex2 {
///     pointer-events: auto;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_pointer-events.asp)
public class PointerEventsProperty: _Property {
    public var propertyKey: PropertyKey<PointerEventsType> { .pointerEvents }
    public var propertyValue: PointerEventsType
    var _content = _PropertyContent<PointerEventsType>()
    
    public init (_ type: PointerEventsType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var pointerEvents: PropertyKey<PointerEventsType> { "pointer-events".propertyKey() }
}
