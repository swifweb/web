//
//  CaretColor.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the color of the cursor (caret) in inputs, textareas, or any element that is editable
///
/// ```html
/// caret-color: red;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_caret-color.asp)
public class CaretColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .caretColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var caretColor: PropertyKey<ColorType> { "caret-color".propertyKey() }
}
