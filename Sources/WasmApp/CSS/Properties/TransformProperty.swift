//
//  Transform.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

/// Applies a 2D or 3D transformation to an element
///
/// ```html
/// div.a {
///     transform: rotate(20deg);
/// }
///
/// div.b {
///     transform: skewY(20deg);
/// }
///
/// div.c {
///     transform: scaleY(1.5);
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_transform.asp)
public class TransformProperty: _Property {
    public var propertyKey: PropertyKey<TransformFunction> { .transform }
    public var propertyValue: TransformFunction
    var _content = _PropertyContent<TransformFunction>()
    
    public init (_ func: TransformFunction) {
        propertyValue = `func`
    }
    
    //    public convenience init (_ type: State<TransformFunction>) {
    //        self.init(type.wrappedValue)
    //        type.listen { self._changed(to: $0) }
    //    }
    //
    //    public convenience init <V>(_ type: ExpressableState<V, TransformFunction>) {
    //        self.init(type.unwrap())
    //    }
}

extension PropertyKey {
    /// Applies a 2D or 3D transformation to an element
    public static var transform: PropertyKey<TransformFunction> { "transform".propertyKey() }
}

extension Stylesheet {
    /// Applies a 2D or 3D transformation to an element
    public typealias Transform = TransformProperty
}

extension CSSRulable {
    /// Applies a 2D or 3D transformation to an element
    public func transform(_ type: TransformFunction) -> Self {
        s?._addProperty(.transform, type)
        return self
    }

    /// Applies a 2D or 3D transformation to an element
    public func transform(_ type: State<TransformFunction>) -> Self {
        s?._addProperty(TransformProperty(type))
        return self
    }

    /// Applies a 2D or 3D transformation to an element
    public func transform<V>(_ type: ExpressableState<V, TransformFunction>) -> Self {
        transform(type.unwrap())
    }
}
