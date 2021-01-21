//
//  HangingPunctuation.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies whether a punctuation character may be placed outside the line box
///
/// ```html
/// hanging-punctuation: first;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_hanging-punctuation.asp)
public class HangingPunctuationProperty: _Property {
    public var propertyKey: PropertyKey<HangingPunctuationType> { .hangingPunctuation }
    public var propertyValue: HangingPunctuationType
    var _content = _PropertyContent<HangingPunctuationType>()
    
    public init (_ type: HangingPunctuationType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<HangingPunctuationType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, HangingPunctuationType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether a punctuation character may be placed outside the line box
    public static var hangingPunctuation: PropertyKey<HangingPunctuationType> { "hanging-punctuation".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether a punctuation character may be placed outside the line box
    public typealias HangingPunctuation = HangingPunctuationProperty
}

extension CSSRulable {
    /// Specifies whether a punctuation character may be placed outside the line box
    public func hangingPunctuation(_ type: HangingPunctuationType) -> Self {
        s?._addProperty(.hangingPunctuation, type)
        return self
    }

    /// Specifies whether a punctuation character may be placed outside the line box
    public func hangingPunctuation(_ type: State<HangingPunctuationType>) -> Self {
        s?._addProperty(HangingPunctuationProperty(type))
        return self
    }

    /// Specifies whether a punctuation character may be placed outside the line box
    public func hangingPunctuation<V>(_ type: ExpressableState<V, HangingPunctuationType>) -> Self {
        hangingPunctuation(type.unwrap())
    }
}
