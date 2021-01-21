//
//  AlignItems.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Specifies the alignment for items inside a flexible container
///
/// ```html
/// align-items: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_align-items.asp)
public class AlignItemsProperty: _Property {
    public var propertyKey: PropertyKey<AlignItemsType> { .alignItems }
    public var propertyValue: AlignItemsType
    var _content = _PropertyContent<AlignItemsType>()
    
    public init (_ type: AlignItemsType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<AlignItemsType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, AlignItemsType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the alignment for items inside a flexible container
    public static var alignItems: PropertyKey<AlignItemsType> { "align-items".propertyKey() }
}

extension Stylesheet {
    /// Specifies the alignment for items inside a flexible container
    public typealias AlignItems = AlignItemsProperty
}

extension CSSRulable {
    /// Specifies the alignment for items inside a flexible container
    public func alignItems(_ type: AlignItemsType) -> Self {
        s?._addProperty(.alignItems, type)
        return self
    }
    
    /// Specifies the alignment for items inside a flexible container
    public func alignItems(_ type: State<AlignItemsType>) -> Self {
        s?._addProperty(AlignItemsProperty(type))
        return self
    }
    
    /// Specifies the alignment for items inside a flexible container
    public func alignItems<V>(_ type: ExpressableState<V, AlignItemsType>) -> Self {
        alignItems(type.unwrap())
    }
}
