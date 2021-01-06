//
//  BackgroundBlendModeProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the blending mode of each background layer (color/image)
///
/// ```html
/// background-blend-mode: lighten;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-blend-mode.asp)
public class BackgroundBlendModeProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundBlendModeType> { .backgroundBlendMode }
    public var propertyValue: BackgroundBlendModeType
    var _content = _PropertyContent<BackgroundBlendModeType>()
    
    public init (_ type: BackgroundBlendModeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundBlendMode: PropertyKey<BackgroundBlendModeType> { "background-blend-mode".propertyKey() }
}
