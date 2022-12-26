//
//  AsType.swift
//  
//
//  Created by Mihael Isaev on 26.12.2022.
//

import Foundation

/// This attribute is only used when rel="preload" or rel="prefetch" has been set on the `<link>` element.
/// It specifies the type of content being loaded by the `<link>`,
/// which is necessary for request matching, application of correct content security policy,
/// and setting of correct Accept request header.
/// Furthermore, rel="preload" uses this as a signal for request prioritization.
/// The table below lists the valid values for this attribute and the elements or resources they apply to.
public final class AsType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// `<audio>` elements
    public static var audio: AsType { .init("audio") }
    
    /// `<iframe>` and `<frame>` elements
    public static var document: AsType { .init("document") }
    
    /// `<embed>` elements
    public static var embed: AsType { .init("embed") }
    
    /// fetch, XHR
    ///
    /// Note: This value also requires `<link>` to contain the crossorigin attribute.
    public static var fetch: AsType { .init("fetch") }
    
    /// CSS @font-face
    public static var font: AsType { .init("font") }
    
    /// `<img>` and `<picture>` elements with srcset or imageset attributes, SVG <image> elements, CSS *-image rules
    public static var image: AsType { .init("image") }
    
    /// `<object>` elements
    public static var object: AsType { .init("object") }
    
    /// `<script>` elements, Worker importScripts
    public static var script: AsType { .init("script") }
    
    /// `<link rel=stylesheet>` elements, CSS @import
    public static var style: AsType { .init("style") }
    
    /// `<track>` elements
    public static var track: AsType { .init("track") }
    
    /// `<video>` elements
    public static var video: AsType { .init("video") }
    
    /// Worker, SharedWorker
    public static var worker: AsType { .init("worker") }
}
