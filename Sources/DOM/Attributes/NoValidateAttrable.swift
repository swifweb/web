//
//  NoValidateAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol NoValidateAttrable: DOMElement {
    @discardableResult
    func noValidate(_ value: Bool) -> Self
    @discardableResult
    func noValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension NoValidateAttrable {
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func noValidate(_ value: Bool) -> Self {
        setAttribute("novalidate", value, .short)
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func noValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        noValidate(value.stateValue.wrappedValue)
        value.stateValue.listen { self.noValidate($0) }
        return self
    }
}

extension Form: NoValidateAttrable {}
