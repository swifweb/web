//
//  SVGImage.swift
//  WasmApp
//
//  Created by Mihael Isaev on 17.12.2020.
//

import Foundation

/// The <image> SVG element includes images inside SVG documents.
/// It can display raster image files or other SVG files.
///
/// The only image formats SVG software must support are JPEG, PNG, and other SVG files.
/// Animated GIF behavior is undefined.
///
/// SVG files displayed with <image> are treated as an image: external resources aren't loaded,
/// :visited styles aren't applied, and they cannot be interactive.
/// To include dynamic SVG elements, try <use> with an external URL.
/// To include SVG files and run scripts inside them, try <object> inside of <foreignObject>.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/image
open class SVGImage: BaseActiveElement {
    
}
