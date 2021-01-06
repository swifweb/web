//
//  BorderImageRepeatProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies whether the border image should be repeated, rounded or stretched
///
/// ```html
/// border-image-repeat: repeat;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-repeat.asp)
public class BorderImageRepeatProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageRepeatType> { .borderImageRepeat }
    public var propertyValue: BorderImageRepeatType
    var _content = _PropertyContent<BorderImageRepeatType>()
    
    public init (_ type: BorderImageRepeatType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageRepeat: PropertyKey<BorderImageRepeatType> { "border-image-repeat".propertyKey() }
}
