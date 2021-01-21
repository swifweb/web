//
//  FlexWrapProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies whether the flexible items should wrap or not
///
/// ```html
/// flex-wrap: wrap;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-wrap.asp)
public class FlexWrapProperty: _Property {
    public var propertyKey: PropertyKey<FlexWrapType> { .flexWrap }
    public var propertyValue: FlexWrapType
    var _content = _PropertyContent<FlexWrapType>()
    
    public init (_ type: FlexWrapType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<FlexWrapType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, FlexWrapType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies whether the flexible items should wrap or not
    public static var flexWrap: PropertyKey<FlexWrapType> { "flex-wrap".propertyKey() }
}

extension Stylesheet {
    /// Specifies whether the flexible items should wrap or not
    public typealias FlexWrap = FlexWrapProperty
}

extension CSSRulable {
    /// Specifies whether the flexible items should wrap or not
    public func flexWrap(_ type: FlexWrapType) -> Self {
        s?._addProperty(.flexWrap, type)
        return self
    }

    /// Specifies whether the flexible items should wrap or not
    public func flexWrap(_ type: State<FlexWrapType>) -> Self {
        s?._addProperty(FlexWrapProperty(type))
        return self
    }

    /// Specifies whether the flexible items should wrap or not
    public func flexWrap<V>(_ type: ExpressableState<V, FlexWrapType>) -> Self {
        flexWrap(type.unwrap())
    }
}
