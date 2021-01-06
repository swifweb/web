//
//  FlexWrapProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies whether the flexible items should wrap or not
///
/// ```html
/// flex-wrap: wrap;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-wrap.asp)
public class FlexWrapProperty: _Property {
    public var propertyKey: PropertyKey<FlexWrapType> { .flexWrap }
    public var propertyValue: FlexWrapType
    var _content = _PropertyContent<FlexWrapType>()
    
    public init (_ type: FlexWrapType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var flexWrap: PropertyKey<FlexWrapType> { "flex-wrap".propertyKey() }
}
