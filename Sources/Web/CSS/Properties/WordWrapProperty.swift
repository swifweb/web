//
//  WordWrap.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Allows long, unbreakable words to be broken and wrap to the next line
///
/// ```html
/// div {
///    word-wrap: break-word;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_word-wrap.asp)
public class WordWrapProperty: _Property {
    public var propertyKey: PropertyKey<WordWrapType> { .wordWrap }
    public var propertyValue: WordWrapType
    var _content = _PropertyContent<WordWrapType>()
    
    public init (_ type: WordWrapType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<WordWrapType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, WordWrapType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Allows long, unbreakable words to be broken and wrap to the next line
    public static var wordWrap: PropertyKey<WordWrapType> { "word-wrap".propertyKey() }
}

extension Stylesheet {
    /// Allows long, unbreakable words to be broken and wrap to the next line
    public typealias WordWrap = WordWrapProperty
}

extension CSSRulable {
    /// Allows long, unbreakable words to be broken and wrap to the next line
    public func wordWrap(_ type: WordWrapType) -> Self {
        s?._addProperty(.wordWrap, type)
        return self
    }

    /// Allows long, unbreakable words to be broken and wrap to the next line
    public func wordWrap(_ type: State<WordWrapType>) -> Self {
        s?._addProperty(WordWrapProperty(type))
        return self
    }

    /// Allows long, unbreakable words to be broken and wrap to the next line
    public func wordWrap<V>(_ type: ExpressableState<V, WordWrapType>) -> Self {
        wordWrap(type.unwrap())
    }
}
