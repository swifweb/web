//
//  TextAlignLast.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Describes how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"
///
/// ```html
/// text-align-last: right;
/// text-align-last: center;
/// text-align-last: justify;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_text-align-last.asp)
public class TextAlignLastProperty: _Property {
    public var propertyKey: PropertyKey<TextAlignLastType> { .textAlignLast }
    public var propertyValue: TextAlignLastType
    var _content = _PropertyContent<TextAlignLastType>()
    
    public init (_ type: TextAlignLastType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TextAlignLastType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TextAlignLastType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Describes how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"
    public static var textAlignLast: PropertyKey<TextAlignLastType> { "text-align-last".propertyKey() }
}

extension Stylesheet {
    /// Describes how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"
    public typealias TextAlignLast = TextAlignLastProperty
}

extension CSSRulable {
    /// Describes how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"
    public func textAlignLast(_ type: TextAlignLastType) -> Self {
        s?._addProperty(.textAlignLast, type)
        return self
    }

    /// Describes how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"
    public func textAlignLast(_ type: State<TextAlignLastType>) -> Self {
        s?._addProperty(TextAlignLastProperty(type))
        return self
    }

    /// Describes how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"
    public func textAlignLast<V>(_ type: ExpressableState<V, TextAlignLastType>) -> Self {
        textAlignLast(type.unwrap())
    }
}
