//
//  PosterAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol PosterAttrable {
    @discardableResult
    func poster(_ value: URLConformable) -> Self
    @discardableResult
    func poster(_ value: State<URLConformable>) -> Self
    @discardableResult
    func poster<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self
}

protocol _PosterAttrable: _AnyElement, PosterAttrable {}

extension PosterAttrable {
    /// A URL indicating a poster frame to show until the user plays or seeks.
    ///
    /// Applicable to <video>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_poster.asp)
    @discardableResult
    public func poster(_ value: URLConformable) -> Self {
        guard let s = self as? _PosterAttrable else { return self }
        s.domElement.poster = value.stringValue.jsValue()
        return self
    }
    
    /// A URL indicating a poster frame to show until the user plays or seeks.
    ///
    /// Applicable to <video>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_poster.asp)
    @discardableResult
    public func poster(_ value: State<URLConformable>) -> Self {
        value.listen { self.poster($0) }
        return self
    }
    
    /// A URL indicating a poster frame to show until the user plays or seeks.
    ///
    /// Applicable to <video>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_poster.asp)
    @discardableResult
    public func poster<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self {
        poster(expressable.unwrap())
    }
}

extension Video: _PosterAttrable {}
