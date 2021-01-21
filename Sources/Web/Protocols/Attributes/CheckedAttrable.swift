//
//  CheckedAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol CheckedAttrable {
    @discardableResult
    func checked(_ value: Bool) -> Self
    @discardableResult
    func checked(_ value: State<Bool>) -> Self
    @discardableResult
    func checked<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _CheckedAttrable: _AnyElement, CheckedAttrable {}

extension CheckedAttrable {
    /// Mark input as `checked`
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefchecked)
    @discardableResult
    public func checked(_ value: Bool) -> Self {
        guard let s = self as? _CheckedAttrable else { return self }
        s.domElement.checked = value.jsValue()
        return self
    }
    
    /// Mark input as `checked`
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefchecked)
    @discardableResult
    public func checked(_ value: State<Bool>) -> Self {
        value.listen { self.checked($0) }
        return self
    }
    
    /// Mark input as `checked`
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefchecked)
    @discardableResult
    public func checked<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        checked(expressable.unwrap())
    }
}

extension InputCheckbox: _CheckedAttrable {}
extension InputRadio: _CheckedAttrable {}
