//
//  PreloadAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol PreloadAttrable {
    @discardableResult
    func preload(_ value: PreloadType) -> Self
    @discardableResult
    func preload(_ value: State<PreloadType>) -> Self
    @discardableResult
    func preload<V>(_ expressable: ExpressableState<V, PreloadType>) -> Self
}

protocol _PreloadAttrable: _AnyElement, PreloadAttrable {}

extension PreloadAttrable {
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to <audio>, <video>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload(_ value: PreloadType) -> Self {
        guard let s = self as? _PreloadAttrable else { return self }
        s.domElement.preload = value.value.jsValue()
        return self
    }
    
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to <audio>, <video>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload(_ value: State<PreloadType>) -> Self {
        value.listen { self.preload($0) }
        return self
    }
    
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to <audio>, <video>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload<V>(_ expressable: ExpressableState<V, PreloadType>) -> Self {
        preload(expressable.unwrap())
    }
}

extension Audio: _PreloadAttrable {}
extension Video: _PreloadAttrable {}
