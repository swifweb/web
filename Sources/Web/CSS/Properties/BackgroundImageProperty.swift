//
//  BackgroundImageProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies one or more background images for an element
///
/// ```html
/// background-image: url("paper.gif");
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-image.asp)
public class BackgroundImageProperty: _Property {
    public var propertyKey: PropertyKey<String> { .backgroundImage }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ src: String) {
        propertyValue = "url(\(src)"
    }
    
    public convenience init (_ type: State<String>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, String>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies one or more background images for an element
    public static var backgroundImage: PropertyKey<String> { "background-image".propertyKey() }
}

extension Stylesheet {
    /// Specifies one or more background images for an element
    public typealias BackgroundImage = BackgroundImageProperty
}

extension CSSRulable {
    /// Specifies one or more background images for an element
    public func backgroundImage(_ type: String) -> Self {
        s?._addProperty(.backgroundImage, type)
        return self
    }

    /// Specifies one or more background images for an element
    public func backgroundImage(_ type: State<String>) -> Self {
        s?._addProperty(BackgroundImageProperty(type))
        return self
    }

    /// Specifies one or more background images for an element
    public func backgroundImage<V>(_ type: ExpressableState<V, String>) -> Self {
        backgroundImage(type.unwrap())
    }
}
