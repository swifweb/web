//
//  PreloadAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol PreloadAttrable: DOMElement {
    @discardableResult
    func preload(_ value: PreloadType) -> Self
    @discardableResult
    func preload<S>(_ value: S) -> Self where S: StateConvertible, S.Value == PreloadType
}

extension PreloadAttrable {
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload(_ value: PreloadType) -> Self {
        setAttribute("preload", value.value)
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

extension Audio: PreloadAttrable {}
extension Video: PreloadAttrable {}
