//
//  BufferedAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
#if arch(wasm32)
import JavaScriptKit
#endif

public protocol BufferedAttrable: DOMElement {
    var buffered: TimeInterval { get }
}

extension BufferedAttrable {
    /// Contains the time range of already buffered media.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/buffered)
    public var buffered: TimeInterval {
        #if arch(wasm32)
        return domElement.buffered.jsValue().number ?? 0
        #else
        return 0
        #endif
    }
}

extension Audio: BufferedAttrable {}
extension Video: BufferedAttrable {}
