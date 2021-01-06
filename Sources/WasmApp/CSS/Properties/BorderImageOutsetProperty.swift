//
//  BorderImageOutsetProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the amount by which the border image area extends beyond the border box
///
/// ```html
/// border-image-outset: 10px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-outset.asp)
public class BorderImageOutsetProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageOutsetType> { .borderImageOutset }
    public var propertyValue: BorderImageOutsetType
    var _content = _PropertyContent<BorderImageOutsetType>()
    
    public init (_ type: BorderImageOutsetType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageOutset: PropertyKey<BorderImageOutsetType> { "border-image-outset".propertyKey() }
}
