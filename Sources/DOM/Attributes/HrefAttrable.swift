//
//  HrefAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol HrefAttrable: DOMElement {
    @discardableResult
    func href<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func href<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension HrefAttrable {
    /// The URL of a linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<link>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href<U: URLConformable>(_ value: U) -> Self {
        setAttribute("href", value.stringValue)
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

extension A: HrefAttrable {}
extension Area: HrefAttrable {}
extension Base: HrefAttrable {}
extension Link: HrefAttrable {}
