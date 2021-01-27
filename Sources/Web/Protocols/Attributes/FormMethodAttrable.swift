//
//  FormMethodAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol FormMethodAttrable {
    @discardableResult
    func formMethod(_ value: MethodType) -> Self
    @discardableResult
    func formMethod<S>(_ value: S) -> Self where S: StateConvertible, S.Value == MethodType
}

protocol _FormMethodAttrable: _AnyElement, FormMethodAttrable {}

extension FormMethodAttrable {
    /// If the button/input is a submit button (type="submit"),
    /// this attribute sets the submission method to use during form submission (GET, POST, etc.).
    /// If this attribute is specified, it overrides the method attribute of the button's form owner.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formmethod.asp)
    @discardableResult
    public func formMethod(_ value: MethodType) -> Self {
        guard let s = self as? _FormMethodAttrable else { return self }
        s.setAttribute("formmethod", value.value)
        return self
    }
    
    /// If the button/input is a submit button (type="submit"),
    /// this attribute sets the submission method to use during form submission (GET, POST, etc.).
    /// If this attribute is specified, it overrides the method attribute of the button's form owner.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formmethod.asp)
    @discardableResult
    public func formMethod<S>(_ value: S) -> Self where S: StateConvertible, S.Value == MethodType {
        formMethod(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formMethod($0) }
        return self
    }
}

extension Button: _FormMethodAttrable {}
extension InputSubmit: _FormMethodAttrable {}
extension InputImage: _FormMethodAttrable {}
