//
//  CheckedAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol CheckedAttrable {
    @discardableResult
    func checked(_ value: Bool) -> Self
    @discardableResult
    func checked<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
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
        s.setAttribute("checked", value, .short)
        return self
    }
    
    /// Mark input as `checked`
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefchecked)
    @discardableResult
    public func checked<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        checked(value.stateValue.wrappedValue)
        value.stateValue.listen { self.checked($0) }
        return self
    }
}

extension InputCheckbox: _CheckedAttrable {}
extension InputRadio: _CheckedAttrable {}
