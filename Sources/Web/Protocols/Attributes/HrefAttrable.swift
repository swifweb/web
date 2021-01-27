//
//  HrefAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol HrefAttrable {
    @discardableResult
    func href<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func href<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

protocol _HrefAttrable: _AnyElement, HrefAttrable {}

extension HrefAttrable {
    /// The URL of a linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<link>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href<U: URLConformable>(_ value: U) -> Self {
        guard let s = self as? _HrefAttrable else { return self }
        s.setAttribute("href", value.stringValue)
        return self
    }
    
    /// The URL of a linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<link>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        href(value.stateValue.wrappedValue)
        value.stateValue.listen { self.href($0) }
        return self
    }
}

extension A: _HrefAttrable {}
extension Area: _HrefAttrable {}
extension Base: _HrefAttrable {}
extension Link: _HrefAttrable {}
