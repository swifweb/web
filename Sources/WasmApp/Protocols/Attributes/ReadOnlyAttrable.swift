//
//  ReadOnlyAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ReadOnlyAttrable {
    @discardableResult
    func readonly(_ value: Bool) -> Self
    @discardableResult
    func readonly(_ value: State<Bool>) -> Self
    @discardableResult
    func readonly<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _ReadOnlyAttrable: _AnyElement, ReadOnlyAttrable {}

extension ReadOnlyAttrable {
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly(_ value: Bool) -> Self {
        guard let s = self as? _ReadOnlyAttrable else { return self }
        s.domElement.readonly = value.jsValue()
        return self
    }
    
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly(_ value: State<Bool>) -> Self {
        value.listen { self.readonly($0) }
        return self
    }
    
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        readonly(expressable.unwrap())
    }
}

extension Input: _ReadOnlyAttrable {}
extension TextArea: _ReadOnlyAttrable {}
