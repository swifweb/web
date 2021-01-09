//
//  TransformStyle.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Specifies how nested elements are rendered in 3D space
///
/// ```html
/// div {
///     transform: rotateY(60deg);
///     transform-style: preserve-3d;
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transform-style.asp)
public class TransformStyleProperty: _Property {
    public var propertyKey: PropertyKey<TransformStyleType> { .transformStyle }
    public var propertyValue: TransformStyleType
    var _content = _PropertyContent<TransformStyleType>()
    
    public init (_ type: TransformStyleType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<TransformStyleType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, TransformStyleType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how nested elements are rendered in 3D space
    public static var transformStyle: PropertyKey<TransformStyleType> { "transform-style".propertyKey() }
}

extension Stylesheet {
    /// Specifies how nested elements are rendered in 3D space
    public typealias TransformStyle = TransformStyleProperty
}

extension CSSRulable {
    /// Specifies how nested elements are rendered in 3D space
    public func transformStyle(_ type: TransformStyleType) -> Self {
        s?._addProperty(.transformStyle, type)
        return self
    }

    /// Specifies how nested elements are rendered in 3D space
    public func transformStyle(_ type: State<TransformStyleType>) -> Self {
        s?._addProperty(TransformStyleProperty(type))
        return self
    }

    /// Specifies how nested elements are rendered in 3D space
    public func transformStyle<V>(_ type: ExpressableState<V, TransformStyleType>) -> Self {
        transformStyle(type.unwrap())
    }
}
