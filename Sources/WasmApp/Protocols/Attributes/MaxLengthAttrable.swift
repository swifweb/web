//
//  MaxLengthAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MaxLengthAttrable {
    @discardableResult
    func maxlength(_ value: UInt) -> Self
    @discardableResult
    func maxlength(_ value: State<UInt>) -> Self
    @discardableResult
    func maxlength<V>(_ expressable: ExpressableState<V, UInt>) -> Self
}

protocol _MaxLengthAttrable: _AnyElement, MaxLengthAttrable {}

extension MaxLengthAttrable {
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength(_ value: UInt) -> Self {
        guard let s = self as? _MaxLengthAttrable else { return self }
        s.domElement.maxlength = value.jsValue()
        return self
    }
    
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength(_ value: State<UInt>) -> Self {
        value.listen { self.maxlength($0) }
        return self
    }
    
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength<V>(_ expressable: ExpressableState<V, UInt>) -> Self {
        maxlength(expressable.unwrap())
    }
}

extension Input: _MaxLengthAttrable {}
extension TextArea: _MaxLengthAttrable {}
