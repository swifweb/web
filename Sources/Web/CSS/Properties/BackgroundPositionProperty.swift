//
//  BackgroundPositionProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the position of a background image
///
/// ```html
/// background-position: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-position.asp)
public class BackgroundPositionProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundPositionType> { .backgroundPosition }
    public var propertyValue: BackgroundPositionType
    var _content = _PropertyContent<BackgroundPositionType>()
    
    public init (_ type: BackgroundPositionType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BackgroundPositionType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BackgroundPositionType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies the position of a background image
    public static var backgroundPosition: PropertyKey<BackgroundPositionType> { "background-position".propertyKey() }
}

extension Stylesheet {
    /// Specifies the position of a background image
    public typealias BackgroundPosition = BackgroundPositionProperty
}

extension CSSRulable {
    /// Specifies the position of a background image
    public func backgroundPosition(_ type: BackgroundPositionType) -> Self {
        s?._addProperty(.backgroundPosition, type)
        return self
    }

    /// Specifies the position of a background image
    public func backgroundPosition(_ type: State<BackgroundPositionType>) -> Self {
        s?._addProperty(BackgroundPositionProperty(type))
        return self
    }

    /// Specifies the position of a background image
    public func backgroundPosition<V>(_ type: ExpressableState<V, BackgroundPositionType>) -> Self {
        backgroundPosition(type.unwrap())
    }
}
