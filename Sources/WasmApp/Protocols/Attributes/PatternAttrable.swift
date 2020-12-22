//
//  PatternAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol PatternAttrable {
    @discardableResult
    func pattern(_ value: String) -> Self
    @discardableResult
    func pattern(_ value: State<String>) -> Self
    @discardableResult
    func pattern<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _PatternAttrable: _AnyElement, PatternAttrable {}

extension PatternAttrable {
    /// Defines a regular expression which the element's value will be validated against.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/pattern)
    @discardableResult
    public func pattern(_ value: String) -> Self {
        guard let s = self as? _PatternAttrable else { return self }
        s.domElement.pattern = value.jsValue()
        return self
    }
    
    /// Defines a regular expression which the element's value will be validated against.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/pattern)
    @discardableResult
    public func pattern(_ value: State<String>) -> Self {
        value.listen { self.pattern($0) }
        return self
    }
    
    /// Defines a regular expression which the element's value will be validated against.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/pattern)
    @discardableResult
    public func pattern<V>(_ expressable: ExpressableState<V, String>) -> Self {
        pattern(expressable.unwrap())
    }
}

extension Input: _PatternAttrable {}
