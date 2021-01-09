//
//  ImageRendering.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Gives a hint to the browser about what aspects of an image are most important to preserve when the image is scaled
///
/// ```html
/// image-rendering: auto;
/// image-rendering: crisp-edges;
/// image-rendering: pixelated;
/// ```
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/image-rendering)
public class ImageRenderingProperty: _Property {
    public var propertyKey: PropertyKey<ImageRenderingType> { .imageRendering }
    public var propertyValue: ImageRenderingType
    var _content = _PropertyContent<ImageRenderingType>()
    
    public init (_ type: ImageRenderingType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ImageRenderingType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ImageRenderingType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Gives a hint to the browser about what aspects of an image are most important to preserve when the image is scaled
    public static var imageRendering: PropertyKey<ImageRenderingType> { "image-rendering".propertyKey() }
}

extension Stylesheet {
    /// Gives a hint to the browser about what aspects of an image are most important to preserve when the image is scaled
    public typealias ImageRendering = ImageRenderingProperty
}

extension CSSRulable {
    /// Gives a hint to the browser about what aspects of an image are most important to preserve when the image is scaled
    public func imageRendering(_ type: ImageRenderingType) -> Self {
        s?._addProperty(.imageRendering, type)
        return self
    }

    /// Gives a hint to the browser about what aspects of an image are most important to preserve when the image is scaled
    public func imageRendering(_ type: State<ImageRenderingType>) -> Self {
        s?._addProperty(ImageRenderingProperty(type))
        return self
    }

    /// Gives a hint to the browser about what aspects of an image are most important to preserve when the image is scaled
    public func imageRendering<V>(_ type: ExpressableState<V, ImageRenderingType>) -> Self {
        imageRendering(type.unwrap())
    }
}
