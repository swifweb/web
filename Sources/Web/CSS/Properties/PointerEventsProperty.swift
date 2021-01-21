//
//  PointerEvents.swift
//  Web
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
    
    public convenience init <A>(_ type: A) where A: StateConvertible, A.Value == PointerEventsType {
        let type = type.stateValue
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }
}

extension PropertyKey {
    /// Defines whether or not an element reacts to pointer events
    public static var pointerEvents: PropertyKey<PointerEventsType> { "pointer-events".propertyKey() }
}

extension Stylesheet {
    /// Defines whether or not an element reacts to pointer events
    public typealias PointerEvents = PointerEventsProperty
}

extension CSSRulable {
    /// Defines whether or not an element reacts to pointer events
    public func pointerEvents(_ type: PointerEventsType) -> Self {
        s?._addProperty(.pointerEvents, type)
        return self
    }

    /// Defines whether or not an element reacts to pointer events
    public func pointerEvents<A>(_ type: A) -> Self where A: StateConvertible, A.Value == PointerEventsType {
        s?._addProperty(PointerEventsProperty(type))
        return self
    }
}
