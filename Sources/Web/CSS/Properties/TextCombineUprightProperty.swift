//
//  TextCombineUpright.swift
//  Web
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
    
    public convenience init (_ type: State<TextCombineUprightType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextCombineUprightType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the combination of multiple characters into the space of a single character
    public static var textCombineUpright: PropertyKey<TextCombineUprightType> { "text-combine-upright".propertyKey() }
}

extension Stylesheet {
    /// Specifies the combination of multiple characters into the space of a single character
    public typealias TextCombineUpright = TextCombineUprightProperty
}

extension CSSRulable {
    /// Specifies the combination of multiple characters into the space of a single character
    public func textCombineUpright(_ type: TextCombineUprightType) -> Self {
        s?._addProperty(.textCombineUpright, type)
        return self
    }

    /// Specifies the combination of multiple characters into the space of a single character
    public func textCombineUpright(_ type: State<TextCombineUprightType>) -> Self {
        s?._addProperty(TextCombineUprightProperty(type))
        return self
    }

    /// Specifies the combination of multiple characters into the space of a single character
    public func textCombineUpright<V>(_ type: ExpressableState<V, TextCombineUprightType>) -> Self {
        textCombineUpright(type.unwrap())
    }
}
