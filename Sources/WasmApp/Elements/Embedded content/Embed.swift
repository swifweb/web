//
//  Embed.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

/// The HTML `<embed>` element embeds external content
/// at the specified point in the document. This content is provided
/// by an external application or other source of interactive content such as a browser plug-in.
///
/// ```swift
/// Embed()
///     .type("video/webm")
///     .src("/media/cc0-videos/flower.mp4")
///     .width(250.px)
///     .height(200.px)
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed)
open class Embed: BaseActiveElement {
    
}
