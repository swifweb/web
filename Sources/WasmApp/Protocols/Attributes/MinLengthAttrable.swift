//
//  MinLengthAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MinLengthAttrable {
    @discardableResult
    func minlength(_ value: UInt) -> Self
    @discardableResult
    func minlength(_ value: State<UInt>) -> Self
    @discardableResult
    func minlength<V>(_ expressable: ExpressableState<V, UInt>) -> Self
}

protocol _MinLengthAttrable: _AnyElement, MinLengthAttrable {}

extension MinLengthAttrable {
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength(_ value: UInt) -> Self {
        guard let s = self as? _MinLengthAttrable else { return self }
        s.domElement.minlength = value.jsValue()
        return self
    }
    
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength(_ value: State<UInt>) -> Self {
        value.listen { self.minlength($0) }
        return self
    }
    
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength<V>(_ expressable: ExpressableState<V, UInt>) -> Self {
        minlength(expressable.unwrap())
    }
}

extension Input: _MinLengthAttrable {}
extension TextArea: _MinLengthAttrable {}
