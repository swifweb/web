//
//  WhiteSpace.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how white-space inside an element is handled
///
/// ```html
/// p.a {
///     white-space: nowrap;
/// }
///
/// p.b {
///     white-space: normal;
/// }
///
/// p.c {
///     white-space: pre;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_white-space.asp)
public class WhiteSpaceProperty: _Property {
    public var propertyKey: PropertyKey<WhiteSpaceType> { .whiteSpace }
    public var propertyValue: WhiteSpaceType
    var _content = _PropertyContent<WhiteSpaceType>()
    
    public init (_ type: WhiteSpaceType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<WhiteSpaceType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, WhiteSpaceType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how white-space inside an element is handled
    public static var whiteSpace: PropertyKey<WhiteSpaceType> { "white-space".propertyKey() }
}

extension Stylesheet {
    /// Specifies how white-space inside an element is handled
    public typealias WhiteSpace = WhiteSpaceProperty
}

extension CSSRulable {
    /// Specifies how white-space inside an element is handled
    public func whiteSpace(_ type: WhiteSpaceType) -> Self {
        s?._addProperty(.whiteSpace, type)
        return self
    }

    /// Specifies how white-space inside an element is handled
    public func whiteSpace(_ type: State<WhiteSpaceType>) -> Self {
        s?._addProperty(WhiteSpaceProperty(type))
        return self
    }

    /// Specifies how white-space inside an element is handled
    public func whiteSpace<V>(_ type: ExpressableState<V, WhiteSpaceType>) -> Self {
        whiteSpace(type.unwrap())
    }
}
