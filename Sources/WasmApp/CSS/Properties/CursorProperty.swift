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
}

extension PropertyKey {
    public static var cursor: PropertyKey<CursorType> { "cursor".propertyKey() }
}
