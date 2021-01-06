//
//  LetterSpacing.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Increases or decreases the space between characters in a text
///
/// ```html
/// letter-spacing: 3px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_letter-spacing.asp)
public class LetterSpacingProperty: _Property {
    public var propertyKey: PropertyKey<LetterSpacingType> { .letterSpacing }
    public var propertyValue: LetterSpacingType
    var _content = _PropertyContent<LetterSpacingType>()
    
    public init (_ type: LetterSpacingType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<LetterSpacingType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, LetterSpacingType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Increases or decreases the space between characters in a text
    public static var letterSpacing: PropertyKey<LetterSpacingType> { "letter-spacing".propertyKey() }
}

extension Stylesheet {
    /// Increases or decreases the space between characters in a text
    public typealias LetterSpacing = LetterSpacingProperty
}

extension CSSRulable {
    /// Increases or decreases the space between characters in a text
    public func letterSpacing(_ type: LetterSpacingType) -> Self {
        s?._addProperty(.letterSpacing, type)
        return self
    }

    /// Increases or decreases the space between characters in a text
    public func letterSpacing(_ type: State<LetterSpacingType>) -> Self {
        s?._addProperty(LetterSpacingProperty(type))
        return self
    }

    /// Increases or decreases the space between characters in a text
    public func letterSpacing<V>(_ type: ExpressableState<V, LetterSpacingType>) -> Self {
        letterSpacing(type.unwrap())
    }
}
