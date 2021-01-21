//
//  HrefAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HrefAttrable {
    @discardableResult
    func href(_ value: URLConformable) -> Self
    @discardableResult
    func href(_ value: State<URLConformable>) -> Self
    @discardableResult
    func href<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self
}

protocol _HrefAttrable: _AnyElement, HrefAttrable {}

extension HrefAttrable {
    /// The URL of a linked resource.
    ///
    /// Applicable to <a>, <area>, <base>, and <link>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href(_ value: URLConformable) -> Self {
        guard let s = self as? _HrefAttrable else { return self }
        s.domElement.href = value.stringValue.jsValue()
        return self
    }
    
    /// The URL of a linked resource.
    ///
    /// Applicable to <a>, <area>, <base>, and <link>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href(_ value: State<URLConformable>) -> Self {
        value.listen { self.href($0) }
        return self
    }
    
    /// The URL of a linked resource.
    ///
    /// Applicable to <a>, <area>, <base>, and <link>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self {
        href(expressable.unwrap())
    }
}

extension A: _HrefAttrable {}
extension Area: _HrefAttrable {}
extension Base: _HrefAttrable {}
extension Link: _HrefAttrable {}
