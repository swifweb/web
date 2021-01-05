//
//  TextCombineUpright.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies the combination of multiple characters into the space of a single character
///
/// ```html
/// /* Keyword values */
/// text-combine-upright: none;
/// text-combine-upright: all;
///
/// /* Digits values */
/// text-combine-upright: digits;     /* fits 2 consecutive digits horizontally inside vertical text */
/// text-combine-upright: digits 4;   /* fits up to 4 consecutive digits horizontally inside vertical text */
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/text-combine-upright)
public class TextCombineUprightProperty: _Property {
    public var propertyKey: PropertyKey<TextCombineUprightType> { .textCombineUpright }
    public var propertyValue: TextCombineUprightType
    var _content = _PropertyContent<TextCombineUprightType>()
    
    public init (_ type: TextCombineUprightType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var textCombineUpright: PropertyKey<TextCombineUprightType> { "text-combine-upright".propertyKey() }
}
