//
//  PreloadAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol PreloadAttrable {
    @discardableResult
    func preload(_ value: PreloadType) -> Self
    @discardableResult
    func preload<S>(_ value: S) -> Self where S: StateConvertible, S.Value == PreloadType
}

protocol _PreloadAttrable: _AnyElement, PreloadAttrable {}

extension PreloadAttrable {
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload(_ value: PreloadType) -> Self {
        guard let s = self as? _PreloadAttrable else { return self }
        s.setAttribute("preload", value.value)
        return self
    }
    
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload<S>(_ value: S) -> Self where S: StateConvertible, S.Value == PreloadType {
        preload(value.stateValue.wrappedValue)
        value.stateValue.listen { self.preload($0) }
        return self
    }
}

extension Audio: _PreloadAttrable {}
extension Video: _PreloadAttrable {}
