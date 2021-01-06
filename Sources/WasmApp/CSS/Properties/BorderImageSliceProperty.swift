//
//  BorderImageSliceProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies how to slice the border image
///
/// ```html
/// border-image-slice: 30%;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-slice.asp)
public class BorderImageSliceProperty: _Property {
    public var propertyKey: PropertyKey<BorderImageSliceType> { .borderImageSlice }
    public var propertyValue: BorderImageSliceType
    var _content = _PropertyContent<BorderImageSliceType>()
    
    public init (_ type: BorderImageSliceType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var borderImageSlice: PropertyKey<BorderImageSliceType> { "border-image-slice".propertyKey() }
}
