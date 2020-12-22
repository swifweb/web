//
//  OpenAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol OpenAttrable {
    @discardableResult
    func open(_ value: Bool) -> Self
    @discardableResult
    func open(_ value: State<Bool>) -> Self
    @discardableResult
    func open<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _OpenAttrable: _AnyElement, OpenAttrable {}

extension OpenAttrable {
    /// Indicates whether the details will be shown on page load.
    ///
    /// Applicable to <details>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_open.asp)
    @discardableResult
    public func open(_ value: Bool) -> Self {
        guard let s = self as? _OpenAttrable else { return self }
        s.domElement.open = value.jsValue()
        return self
    }
    
    /// Indicates whether the details will be shown on page load.
    ///
    /// Applicable to <details>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_open.asp)
    @discardableResult
    public func open(_ value: State<Bool>) -> Self {
        value.listen { self.open($0) }
        return self
    }
    
    /// Indicates whether the details will be shown on page load.
    ///
    /// Applicable to <details>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_open.asp)
    @discardableResult
    public func open<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        open(expressable.unwrap())
    }
}

extension Details: _OpenAttrable {}
