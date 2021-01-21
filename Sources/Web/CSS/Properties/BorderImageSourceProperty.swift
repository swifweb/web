//
//  BorderImageSourceProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the path to the image to be used as a border
///
/// ```html
/// border-image-source: url(border.png);
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-image-source.asp)
public class BorderImageSourceProperty: _Property {
    public var propertyKey: PropertyKey<String> { .borderImageSource }
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
    /// Specifies the path to the image to be used as a border
    public static var borderImageSource: PropertyKey<String> { "border-image-source".propertyKey() }
}

extension Stylesheet {
    /// Specifies the path to the image to be used as a border
    public typealias BorderImageSource = BorderImageSourceProperty
}

extension CSSRulable {
    /// Specifies the path to the image to be used as a border
    public func borderImageSource(_ type: String) -> Self {
        s?._addProperty(.borderImageSource, type)
        return self
    }

    /// Specifies the path to the image to be used as a border
    public func borderImageSource(_ type: State<String>) -> Self {
        s?._addProperty(BorderImageSourceProperty(type))
        return self
    }

    /// Specifies the path to the image to be used as a border
    public func borderImageSource<V>(_ type: ExpressableState<V, String>) -> Self {
        borderImageSource(type.unwrap())
    }
}
