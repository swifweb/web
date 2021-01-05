//
//  Overflow.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies whether or not the browser may break lines within words in order to prevent overflow (when a string is too long to fit its containing box)
///
/// ```html
/// overflow-wrap: normal;
/// overflow-wrap: break-word;
/// overflow-wrap: anywhere;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap)
public class OverflowWrapProperty: _Property {
    public var propertyKey: PropertyKey<OverflowWrapType> { .overflowWrap }
    public var propertyValue: OverflowWrapType
    var _content = _PropertyContent<OverflowWrapType>()
    
    public init (_ type: OverflowWrapType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var overflowWrap: PropertyKey<OverflowWrapType> { "overflow-wrap".propertyKey() }
}

/// Specifies what happens if content overflows an element's box
///
/// ```html
/// overflow: scroll;
/// overflow: hidden;
/// overflow: auto;
/// overflow: visible;
/// ```
///
/// [Learn more](___)
public class OverflowProperty: _Property {
    public var propertyKey: PropertyKey<OverflowType> { .overflow }
    public var propertyValue: OverflowType
    var _content = _PropertyContent<OverflowType>()
    
    public init (_ type: OverflowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var overflow: PropertyKey<OverflowType> { "overflow".propertyKey() }
}

/// Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area
///
/// ```html
/// overflow-x: scroll;
/// overflow-x: hidden;
/// overflow-x: auto;
/// overflow-x: visible;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_overflow-x.asp)
public class OverflowXProperty: _Property {
    public var propertyKey: PropertyKey<OverflowType> { .overflowX }
    public var propertyValue: OverflowType
    var _content = _PropertyContent<OverflowType>()
    
    public init (_ type: OverflowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var overflowX: PropertyKey<OverflowType> { "overflow-x".propertyKey() }
}

/// Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area
///
/// ```html
/// overflow-y: scroll;
/// overflow-y: hidden;
/// overflow-y: auto;
/// overflow-y: visible;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_overflow-y.asp)
public class OverflowYProperty: _Property {
    public var propertyKey: PropertyKey<OverflowType> { .overflowY }
    public var propertyValue: OverflowType
    var _content = _PropertyContent<OverflowType>()
    
    public init (_ type: OverflowType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var overflowY: PropertyKey<OverflowType> { "overflow-y".propertyKey() }
}

public struct OverflowType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The content is not clipped, and it may be rendered outside the left and right edges. This is default
    public static var visible: Self { .init("visible") }
    
    /// The content is clipped - and no scrolling mechanism is provided
    public static var hidden: Self { .init("hidden") }
    
    /// The content is clipped and a scrolling mechanism is provided
    public static var scroll: Self { .init("scroll") }
    
    public var description: String { value }
}
