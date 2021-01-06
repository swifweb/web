//
//  BackgroundOriginProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the origin position of a background image
///
/// ```html
/// background-origin: content-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-origin.asp)
public class BackgroundOriginProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundOriginType> { .backgroundOrigin }
    public var propertyValue: BackgroundOriginType
    var _content = _PropertyContent<BackgroundOriginType>()
    
    public init (_ type: BackgroundOriginType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BackgroundOriginType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BackgroundOriginType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the origin position of a background image
    public static var backgroundOrigin: PropertyKey<BackgroundOriginType> { "background-origin".propertyKey() }
}

extension Stylesheet {
    /// Specifies the origin position of a background image
    public typealias BackgroundOrigin = BackgroundOriginProperty
}

extension CSSRulable {
    /// Specifies the origin position of a background image
    public func backgroundOrigin(_ type: BackgroundOriginType) -> Self {
        s?._addProperty(.backgroundOrigin, type)
        return self
    }

    /// Specifies the origin position of a background image
    public func backgroundOrigin(_ type: State<BackgroundOriginType>) -> Self {
        s?._addProperty(BackgroundOriginProperty(type))
        return self
    }

    /// Specifies the origin position of a background image
    public func backgroundOrigin<V>(_ type: ExpressableState<V, BackgroundOriginType>) -> Self {
        backgroundOrigin(type.unwrap())
    }
}
