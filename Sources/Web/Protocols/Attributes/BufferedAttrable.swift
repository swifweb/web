//
//  BufferedAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

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
        return s.domElement.buffered.jsValue().number ?? 0
    }
}

extension Audio: _BufferedAttrable {}
extension Video: _BufferedAttrable {}
