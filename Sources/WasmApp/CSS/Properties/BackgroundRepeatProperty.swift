//
//  BackgroundRepeatProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets if/how a background image will be repeated
///
/// ```html
/// background-repeat: repeat-y;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-repeat.asp)
public class BackgroundRepeatProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundRepeatType> { .backgroundRepeat }
    public var propertyValue: BackgroundRepeatType
    var _content = _PropertyContent<BackgroundRepeatType>()
    
    public init (_ type: BackgroundRepeatType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundRepeat: PropertyKey<BackgroundRepeatType> { "background-repeat".propertyKey() }
}
