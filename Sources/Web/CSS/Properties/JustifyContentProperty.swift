//
//  JustifyContent.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the alignment between the items inside a flexible container when the items do not use all available space
///
/// ```html
/// justify-content: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_justify-content.asp)
public class JustifyContentProperty: _Property {
    public var propertyKey: PropertyKey<JustifyContentType> { .justifyContent }
    public var propertyValue: JustifyContentType
    var _content = _PropertyContent<JustifyContentType>()
    
    public init (_ type: JustifyContentType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<JustifyContentType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, JustifyContentType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the alignment between the items inside a flexible container when the items do not use all available space
    public static var justifyContent: PropertyKey<JustifyContentType> { "justify-content".propertyKey() }
}

extension Stylesheet {
    /// Specifies the alignment between the items inside a flexible container when the items do not use all available space
    public typealias JustifyContent = JustifyContentProperty
}

extension CSSRulable {
    /// Specifies the alignment between the items inside a flexible container when the items do not use all available space
    public func justifyContent(_ type: JustifyContentType) -> Self {
        s?._addProperty(.justifyContent, type)
        return self
    }

    /// Specifies the alignment between the items inside a flexible container when the items do not use all available space
    public func justifyContent(_ type: State<JustifyContentType>) -> Self {
        s?._addProperty(JustifyContentProperty(type))
        return self
    }

    /// Specifies the alignment between the items inside a flexible container when the items do not use all available space
    public func justifyContent<V>(_ type: ExpressableState<V, JustifyContentType>) -> Self {
        justifyContent(type.unwrap())
    }
}
