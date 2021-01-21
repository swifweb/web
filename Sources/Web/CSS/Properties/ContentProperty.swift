//
//  Content.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Used with the :before and :after pseudo-elements, to insert generated content
///
/// ```html
/// content: "•";
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_gen_content.asp)
public class ContentProperty: _Property {
    public var propertyKey: PropertyKey<ContentType> { .content }
    public var propertyValue: ContentType
    var _content = _PropertyContent<ContentType>()
    
    public init (_ type: ContentType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ContentType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ContentType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Used with the :before and :after pseudo-elements, to insert generated content
    public static var content: PropertyKey<ContentType> { "content".propertyKey() }
}

extension Stylesheet {
    /// Used with the :before and :after pseudo-elements, to insert generated content
    public typealias Content = ContentProperty
}

extension CSSRulable {
    /// Used with the :before and :after pseudo-elements, to insert generated content
    public func content(_ type: ContentType) -> Self {
        s?._addProperty(.content, type)
        return self
    }

    /// Used with the :before and :after pseudo-elements, to insert generated content
    public func content(_ type: State<ContentType>) -> Self {
        s?._addProperty(ContentProperty(type))
        return self
    }

    /// Used with the :before and :after pseudo-elements, to insert generated content
    public func content<V>(_ type: ExpressableState<V, ContentType>) -> Self {
        content(type.unwrap())
    }
}
