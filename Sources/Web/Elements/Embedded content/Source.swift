//
//  Source.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

/// The HTML `<source>` element specifies multiple media resources
/// for the picture, the audio element, or the video element.
///
/// ```swift
/// Video {
///     Source()
///         .src("/media/cc0-videos/flower.webm")
///         .type("video/webm")
///     Source()
///         .src("/media/cc0-videos/flower.mp4")
///         .type("video/mp4")
/// }
/// .controls(true)
/// .width(250.px)
/// .height(200.px)
/// .muted(true)
/// .innerText("This browser does not support the HTML5 video element.")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source)
open class Source: BaseActiveElement {
    
}
