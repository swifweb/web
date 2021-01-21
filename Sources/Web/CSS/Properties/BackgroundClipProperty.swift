//
//  BackgroundClipProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Defines how far the background (color or image) should extend within an element
///
/// ```html
/// background-clip: padding-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-clip.asp)
public class BackgroundClipProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundClipType> { .backgroundClip }
    public var propertyValue: BackgroundClipType
    var _content = _PropertyContent<BackgroundClipType>()
    
    public init (_ type: BackgroundClipType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BackgroundClipType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BackgroundClipType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Defines how far the background (color or image) should extend within an element
    public static var backgroundClip: PropertyKey<BackgroundClipType> { "background-clip".propertyKey() }
}

extension Stylesheet {
    /// Defines how far the background (color or image) should extend within an element
    public typealias BackgroundClip = BackgroundClipProperty
}

extension CSSRulable {
    /// Defines how far the background (color or image) should extend within an element
    public func backgroundClip(_ type: BackgroundClipType) -> Self {
        s?._addProperty(.backgroundClip, type)
        return self
    }

    /// Defines how far the background (color or image) should extend within an element
    public func backgroundClip(_ type: State<BackgroundClipType>) -> Self {
        s?._addProperty(BackgroundClipProperty(type))
        return self
    }

    /// Defines how far the background (color or image) should extend within an element
    public func backgroundClip<V>(_ type: ExpressableState<V, BackgroundClipType>) -> Self {
        backgroundClip(type.unwrap())
    }
}
