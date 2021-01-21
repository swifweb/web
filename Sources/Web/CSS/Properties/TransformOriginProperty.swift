//
//  TransformOrigin.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Allows you to change the position on transformed elements
///
/// ```html
/// div {
///     transform: rotate(45deg);
///     transform-origin: 20% 40%;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transform-origin.asp)
public class TransformOriginProperty: _Property {
    public var propertyKey: PropertyKey<TransformOriginType> { .transformOrigin }
    public var propertyValue: TransformOriginType
    var _content = _PropertyContent<TransformOriginType>()
    
    public init (_ type: TransformOriginType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TransformOriginType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TransformOriginType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Allows you to change the position on transformed elements
    public static var transformOrigin: PropertyKey<TransformOriginType> { "transform-origin".propertyKey() }
}

extension Stylesheet {
    /// Allows you to change the position on transformed elements
    public typealias TransformOrigin = TransformOriginProperty
}

extension CSSRulable {
    /// Allows you to change the position on transformed elements
    public func transformOrigin(_ type: TransformOriginType) -> Self {
        s?._addProperty(.transformOrigin, type)
        return self
    }

    /// Allows you to change the position on transformed elements
    public func transformOrigin(_ type: State<TransformOriginType>) -> Self {
        s?._addProperty(TransformOriginProperty(type))
        return self
    }

    /// Allows you to change the position on transformed elements
    public func transformOrigin<V>(_ type: ExpressableState<V, TransformOriginType>) -> Self {
        transformOrigin(type.unwrap())
    }
}
