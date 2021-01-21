//
//  OverflowXProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

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
    
    public convenience init (_ type: State<OverflowType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, OverflowType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area
    public static var overflowX: PropertyKey<OverflowType> { "overflow-x".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area
    public typealias OverflowX = OverflowXProperty
}

extension CSSRulable {
    /// Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area
    public func overflowX(_ type: OverflowType) -> Self {
        s?._addProperty(.overflowX, type)
        return self
    }

    /// Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area
    public func overflowX(_ type: State<OverflowType>) -> Self {
        s?._addProperty(OverflowXProperty(type))
        return self
    }

    /// Specifies whether or not to clip the left/right edges of the content, if it overflows the element's content area
    public func overflowX<V>(_ type: ExpressableState<V, OverflowType>) -> Self {
        overflowX(type.unwrap())
    }
}
