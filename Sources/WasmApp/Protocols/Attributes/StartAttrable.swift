//
//  StartAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol StartAttrable {
    @discardableResult
    func start(_ value: Int) -> Self
    @discardableResult
    func start(_ value: State<Int>) -> Self
    @discardableResult
    func start<V>(_ expressable: ExpressableState<V, Int>) -> Self
}

protocol _StartAttrable: _AnyElement, StartAttrable {}

extension StartAttrable {
    /// Defines the first number if other than 1.
    ///
    /// Applicable to <ol>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_start.asp)
    @discardableResult
    public func start(_ value: Int) -> Self {
        guard let s = self as? _StartAttrable else { return self }
        s.domElement.start = value.jsValue()
        return self
    }
    
    /// Defines the first number if other than 1.
    ///
    /// Applicable to <ol>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_start.asp)
    @discardableResult
    public func start(_ value: State<Int>) -> Self {
        value.listen { self.start($0) }
        return self
    }
    
    /// Defines the first number if other than 1.
    ///
    /// Applicable to <ol>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_start.asp)
    @discardableResult
    public func start<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        start(expressable.unwrap())
    }
}

extension Ol: _StartAttrable {}
