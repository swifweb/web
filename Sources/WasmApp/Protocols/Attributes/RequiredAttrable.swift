//
//  RequiredAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol RequiredAttrable {
    @discardableResult
    func required(_ value: Bool) -> Self
    @discardableResult
    func required(_ value: State<Bool>) -> Self
    @discardableResult
    func required<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _RequiredAttrable: _AnyElement, RequiredAttrable {}

extension RequiredAttrable {
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required(_ value: Bool) -> Self {
        guard let s = self as? _RequiredAttrable else { return self }
        s.domElement.required = value.jsValue()
        return self
    }
    
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required(_ value: State<Bool>) -> Self {
        value.listen { self.required($0) }
        return self
    }
    
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        required(expressable.unwrap())
    }
}

extension Input: _RequiredAttrable {}
extension Select: _RequiredAttrable {}
extension TextArea: _RequiredAttrable {}
