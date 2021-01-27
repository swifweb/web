//
//  BufferedAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
#if arch(wasm32)
import JavaScriptKit
#endif

public protocol BufferedAttrable {
    var buffered: TimeInterval { get }
}

protocol _BufferedAttrable: _AnyElement, BufferedAttrable {}

extension BufferedAttrable {
    /// Contains the time range of already buffered media.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/buffered)
    public var buffered: TimeInterval {
        guard let s = self as? _BufferedAttrable else { return 0 }
        #if arch(wasm32)
        return s.domElement.buffered.jsValue().number ?? 0
        #else
        return 0
        #endif
    }
}

extension Audio: _BufferedAttrable {}
extension Video: _BufferedAttrable {}
