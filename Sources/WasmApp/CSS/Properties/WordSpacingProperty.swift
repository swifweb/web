//
//  WordSpacing.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Increases or decreases the space between words in a text
///
/// ```html
/// p {
///    word-spacing: 30px;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_text_word-spacing.asp)
public class WordSpacingProperty: _Property {
    public var propertyKey: PropertyKey<WordSpacingType> { .wordSpacing }
    public var propertyValue: WordSpacingType
    var _content = _PropertyContent<WordSpacingType>()
    
    public init (_ type: WordSpacingType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<WordSpacingType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, WordSpacingType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Increases or decreases the space between words in a text
    public static var wordSpacing: PropertyKey<WordSpacingType> { "word-spacing".propertyKey() }
}

extension Stylesheet {
    /// Increases or decreases the space between words in a text
    public typealias WordSpacing = WordSpacingProperty
}

extension CSSRulable {
    /// Increases or decreases the space between words in a text
    public func wordSpacing(_ type: WordSpacingType) -> Self {
        s?._addProperty(.wordSpacing, type)
        return self
    }

    /// Increases or decreases the space between words in a text
    public func wordSpacing(_ type: State<WordSpacingType>) -> Self {
        s?._addProperty(WordSpacingProperty(type))
        return self
    }

    /// Increases or decreases the space between words in a text
    public func wordSpacing<V>(_ type: ExpressableState<V, WordSpacingType>) -> Self {
        wordSpacing(type.unwrap())
    }
    
    /// Increases or decreases the space between words in a text
    public func wordSpacing<U: UnitValuable>(_ type: U) -> Self {
        wordSpacing(.length(type))
    }

    /// Increases or decreases the space between words in a text
    public func wordSpacing<U: UnitValuable>(_ type: State<U>) -> Self {
        wordSpacing(type.map { .length($0) })
    }

    /// Increases or decreases the space between words in a text
    public func wordSpacing<V, U: UnitValuable>(_ type: ExpressableState<V, U>) -> Self {
        wordSpacing(type.unwrap())
    }
}
