//
//  RelAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol RelAttrable {
    @discardableResult
    func rel(_ value: RelType) -> Self
    @discardableResult
    func rel<S>(_ value: S) -> Self where S: StateConvertible, S.Value == RelType
}

protocol _RelAttrable: _AnyElement, RelAttrable {}

extension RelAttrable {
    /// Specifies the relationship of the target object to the link object.
    ///
    /// Applicable to `<a>`, `<area>`, `<form>`, and `<link>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func rel(_ value: RelType) -> Self {
        guard let s = self as? _RelAttrable else { return self }
        s.setAttribute("rel", value.value)
        return self
    }
    
    /// Specifies the relationship of the target object to the link object.
    ///
    /// Applicable to `<a>`, `<area>`, `<form>`, and `<link>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func rel<S>(_ value: S) -> Self where S: StateConvertible, S.Value == RelType {
        rel(value.stateValue.wrappedValue)
        value.stateValue.listen { self.rel($0) }
        return self
    }
}

extension A: _RelAttrable {}
extension Area: _RelAttrable {}
extension Link: _RelAttrable {}
