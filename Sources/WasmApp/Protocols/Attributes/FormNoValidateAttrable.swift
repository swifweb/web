//
//  FormNoValidateAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol FormNoValidateAttrable {
    @discardableResult
    func formNoValidate(_ value: Bool) -> Self
    @discardableResult
    func formNoValidate(_ value: State<Bool>) -> Self
    @discardableResult
    func formNoValidate<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _FormNoValidateAttrable: _AnyElement, FormNoValidateAttrable {}

extension FormNoValidateAttrable {
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to <button>, <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func formNoValidate(_ value: Bool) -> Self {
        guard let s = self as? _FormNoValidateAttrable else { return self }
        s.domElement.formnovalidate = value.jsValue()
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to <button>, <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func formNoValidate(_ value: State<Bool>) -> Self {
        value.listen { self.formNoValidate($0) }
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to <button>, <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func formNoValidate<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        formNoValidate(expressable.unwrap())
    }
}

extension Button: _FormNoValidateAttrable {}
extension Form: _FormNoValidateAttrable {}
