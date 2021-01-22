//
//  NoValidateAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol NoValidateAttrable {
    @discardableResult
    func noValidate(_ value: Bool) -> Self
    @discardableResult
    func noValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _NoValidateAttrable: _AnyElement, NoValidateAttrable {}

extension NoValidateAttrable {
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func noValidate(_ value: Bool) -> Self {
        guard let s = self as? _NoValidateAttrable else { return self }
        s.domElement.novalidate = value.jsValue()
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

extension Form: _NoValidateAttrable {}
