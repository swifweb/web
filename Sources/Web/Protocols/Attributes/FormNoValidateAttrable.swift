//
//  FormNoValidateAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol FormNoValidateAttrable {
    @discardableResult
    func formNoValidate(_ value: Bool) -> Self
    @discardableResult
    func formNoValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _FormNoValidateAttrable: _AnyElement, FormNoValidateAttrable {}

extension FormNoValidateAttrable {
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func formNoValidate(_ value: Bool) -> Self {
        guard let s = self as? _FormNoValidateAttrable else { return self }
        s.setAttribute("formnovalidate", value, .short)
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func formNoValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        formNoValidate(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formNoValidate($0) }
        return self
    }
}

extension Button: _FormNoValidateAttrable {}
extension Form: _FormNoValidateAttrable {}
