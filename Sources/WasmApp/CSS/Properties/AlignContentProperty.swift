//
//  AlignContent.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the alignment between the lines inside a flexible container when the items do not use all available space
///
/// ```html
/// align-content: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_align-content.asp)
public class AlignContentProperty: _Property {
    public var propertyKey: PropertyKey<AlignContentType> { .alignContent }
    public var propertyValue: AlignContentType
    var _content = _PropertyContent<AlignContentType>()
    
    public init (_ type: AlignContentType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<AlignContentType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }
    
    public convenience init <V>(_ type: ExpressableState<V, AlignContentType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the alignment between the lines inside a flexible container when the items do not use all available space
    public static var alignContent: PropertyKey<AlignContentType> { "align-content".propertyKey() }
}

extension Stylesheet {
    /// Specifies the alignment between the lines inside a flexible container when the items do not use all available space
    public typealias AlignContent = AlignContentProperty
}

extension CSSRulable {
    /// Specifies the alignment between the lines inside a flexible container when the items do not use all available space
    public func alignContent(_ type: AlignContentType) -> Self {
        s?._addProperty(.alignContent, type)
        return self
    }
    
    /// Specifies the alignment between the lines inside a flexible container when the items do not use all available space
    public func alignContent(_ type: State<AlignContentType>) -> Self {
        s?._addProperty(AlignContentProperty(type))
        return self
    }
    
    /// Specifies the alignment between the lines inside a flexible container when the items do not use all available space
    public func alignContent<V>(_ type: ExpressableState<V, AlignContentType>) -> Self {
        alignContent(type.unwrap())
    }
}
