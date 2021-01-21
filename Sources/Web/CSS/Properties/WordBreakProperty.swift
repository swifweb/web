//
//  WordBreak.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how words should break when reaching the end of a line
///
/// ```html
/// p.a {
///    word-break: break-all;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_word-break.asp)
public class WordBreakProperty: _Property {
    public var propertyKey: PropertyKey<WordBreakType> { .wordBreak }
    public var propertyValue: WordBreakType
    var _content = _PropertyContent<WordBreakType>()
    
    public init (_ type: WordBreakType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<WordBreakType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, WordBreakType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how words should break when reaching the end of a line
    public static var wordBreak: PropertyKey<WordBreakType> { "word-break".propertyKey() }
}

extension Stylesheet {
    /// Specifies how words should break when reaching the end of a line
    public typealias WordBreak = WordBreakProperty
}

extension CSSRulable {
    /// Specifies how words should break when reaching the end of a line
    public func wordBreak(_ type: WordBreakType) -> Self {
        s?._addProperty(.wordBreak, type)
        return self
    }

    /// Specifies how words should break when reaching the end of a line
    public func wordBreak(_ type: State<WordBreakType>) -> Self {
        s?._addProperty(WordBreakProperty(type))
        return self
    }

    /// Specifies how words should break when reaching the end of a line
    public func wordBreak<V>(_ type: ExpressableState<V, WordBreakType>) -> Self {
        wordBreak(type.unwrap())
    }
}
