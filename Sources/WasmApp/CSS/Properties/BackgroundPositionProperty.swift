//
//  BackgroundPositionProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the position of a background image
///
/// ```html
/// background-position: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-position.asp)
public class BackgroundPositionProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundPositionType> { .backgroundPosition }
    public var propertyValue: BackgroundPositionType
    var _content = _PropertyContent<BackgroundPositionType>()
    
    public init (_ type: BackgroundPositionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundPosition: PropertyKey<BackgroundPositionType> { "background-position".propertyKey() }
}
