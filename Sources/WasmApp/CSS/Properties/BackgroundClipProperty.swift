//
//  BackgroundClipProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines how far the background (color or image) should extend within an element
///
/// ```html
/// background-clip: padding-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-clip.asp)
public class BackgroundClipProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundClipType> { .backgroundClip }
    public var propertyValue: BackgroundClipType
    var _content = _PropertyContent<BackgroundClipType>()
    
    public init (_ type: BackgroundClipType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundClip: PropertyKey<BackgroundClipType> { "background-clip".propertyKey() }
}
