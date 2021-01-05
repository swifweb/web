//
//  ImageRendering.swift
//  SwifCSS
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
}

extension PropertyKey {
    public static var imageRendering: PropertyKey<ImageRenderingType> { "image-rendering".propertyKey() }
}
