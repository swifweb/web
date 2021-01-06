//
//  OverflowWrapProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
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
