//
//  ContentAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ContentAttrable {
    @discardableResult
    func content(_ value: String) -> Self
    @discardableResult
    func content(_ value: State<String>) -> Self
    @discardableResult
    func content<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _ContentAttrable: _AnyElement, ContentAttrable {}

extension ContentAttrable {
    /// A value associated with http-equiv or name depending on the context.
    ///
    /// Applicable to <meta>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/content)
    @discardableResult
    public func content(_ value: String) -> Self {
        guard let s = self as? _ContentAttrable else { return self }
        s.domElement.content = value.jsValue()
        return self
    }
    
    /// A value associated with http-equiv or name depending on the context.
    ///
    /// Applicable to <meta>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/content)
    @discardableResult
    public func content(_ value: State<String>) -> Self {
        value.listen { self.content($0) }
        return self
    }
    
    /// A value associated with http-equiv or name depending on the context.
    ///
    /// Applicable to <meta>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/content)
    @discardableResult
    public func content<V>(_ expressable: ExpressableState<V, String>) -> Self {
        content(expressable.unwrap())
    }
}

extension Meta: _ContentAttrable {}
