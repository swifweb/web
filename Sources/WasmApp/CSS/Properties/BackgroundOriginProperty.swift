//
//  BackgroundOriginProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the origin position of a background image
///
/// ```html
/// background-origin: content-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-origin.asp)
public class BackgroundOriginProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundOriginType> { .backgroundOrigin }
    public var propertyValue: BackgroundOriginType
    var _content = _PropertyContent<BackgroundOriginType>()
    
    public init (_ type: BackgroundOriginType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundOrigin: PropertyKey<BackgroundOriginType> { "background-origin".propertyKey() }
}
