//
//  Cursor.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the mouse cursor to be displayed when pointing over an element
///
/// ```html
/// cursor: auto;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_class_cursor.asp)
public class CursorProperty: _Property {
    public var propertyKey: PropertyKey<CursorType> { .cursor }
    public var propertyValue: CursorType
    var _content = _PropertyContent<CursorType>()
    
    public init (_ type: CursorType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<CursorType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, CursorType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the mouse cursor to be displayed when pointing over an element
    public static var cursor: PropertyKey<CursorType> { "cursor".propertyKey() }
}

extension Stylesheet {
    /// Specifies the mouse cursor to be displayed when pointing over an element
    public typealias Cursor = CursorProperty
}

extension CSSRulable {
    /// Specifies the mouse cursor to be displayed when pointing over an element
    public func cursor(_ type: CursorType) -> Self {
        s?._addProperty(.cursor, type)
        return self
    }

    /// Specifies the mouse cursor to be displayed when pointing over an element
    public func cursor(_ type: State<CursorType>) -> Self {
        s?._addProperty(CursorProperty(type))
        return self
    }

    /// Specifies the mouse cursor to be displayed when pointing over an element
    public func cursor<V>(_ type: ExpressableState<V, CursorType>) -> Self {
        cursor(type.unwrap())
    }
}
