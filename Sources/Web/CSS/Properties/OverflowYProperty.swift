//
//  OverflowYProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public convenience init (_ type: State<OverflowType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, OverflowType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area
    public static var overflowY: PropertyKey<OverflowType> { "overflow-y".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area
    public typealias OverflowY = OverflowYProperty
}

extension CSSRulable {
    /// Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area
    public func overflowY(_ type: OverflowType) -> Self {
        s?._addProperty(.overflowY, type)
        return self
    }

    /// Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area
    public func overflowY(_ type: State<OverflowType>) -> Self {
        s?._addProperty(OverflowYProperty(type))
        return self
    }

    /// Specifies whether or not to clip the top/bottom edges of the content, if it overflows the element's content area
    public func overflowY<V>(_ type: ExpressableState<V, OverflowType>) -> Self {
        overflowY(type.unwrap())
    }
}
