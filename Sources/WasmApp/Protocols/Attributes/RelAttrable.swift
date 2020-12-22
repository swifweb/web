//
//  RelAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol RelAttrable {
    @discardableResult
    func rel(_ value: RelType) -> Self
    @discardableResult
    func rel(_ value: State<RelType>) -> Self
    @discardableResult
    func rel<V>(_ expressable: ExpressableState<V, RelType>) -> Self
}

protocol _RelAttrable: _AnyElement, RelAttrable {}

extension RelAttrable {
    /// Specifies the relationship of the target object to the link object.
    ///
    /// Applicable to <a>, <area>, <form>, and <link>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func rel(_ value: RelType) -> Self {
        guard let s = self as? _RelAttrable else { return self }
        s.domElement.rel = value.value.jsValue()
        return self
    }
    
    /// Specifies the relationship of the target object to the link object.
    ///
    /// Applicable to <a>, <area>, <form>, and <link>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func rel(_ value: State<RelType>) -> Self {
        value.listen { self.rel($0) }
        return self
    }
    
    /// Specifies the relationship of the target object to the link object.
    ///
    /// Applicable to <a>, <area>, <form>, and <link>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func rel<V>(_ expressable: ExpressableState<V, RelType>) -> Self {
        rel(expressable.unwrap())
    }
}

extension A: _RelAttrable {}
extension Area: _RelAttrable {}
extension Link: _RelAttrable {}
