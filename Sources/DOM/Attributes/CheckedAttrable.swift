//
//  CheckedAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol CheckedAttrable: DOMElement {
    @discardableResult
    func checked(_ value: Bool) -> Self
    @discardableResult
    func checked<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension CheckedAttrable {
    /// Mark input as `checked`
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefchecked)
    @discardableResult
    public func checked(_ value: Bool) -> Self {
        setAttribute("checked", value, .short)
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

extension InputCheckbox: CheckedAttrable {}
extension InputRadio: CheckedAttrable {}
