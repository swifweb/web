//
//  ZIndex.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Sets the stack order of a positioned element
///
/// ```html
/// img {
///     position: absolute;
///     left: 0px;
///     top: 0px;
///     z-index: -1;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_pos_z-index.asp)
public class ZIndexProperty: _Property {
    public var propertyKey: PropertyKey<Int> { .zIndex }
    public var propertyValue: Int
    var _content = _PropertyContent<Int>()
    
    public init (_ value: Int) {
        propertyValue = value
    }
}

extension PropertyKey {
    public static var zIndex: PropertyKey<Int> { "z-index".propertyKey() }
}
