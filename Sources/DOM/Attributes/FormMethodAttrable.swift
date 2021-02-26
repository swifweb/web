//
//  FormMethodAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol FormMethodAttrable: DOMElement {
    @discardableResult
    func formMethod(_ value: MethodType) -> Self
    @discardableResult
    func formMethod<S>(_ value: S) -> Self where S: StateConvertible, S.Value == MethodType
}

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
        setAttribute("formmethod", value.value)
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

extension Button: FormMethodAttrable {}
extension InputSubmit: FormMethodAttrable {}
extension InputImage: FormMethodAttrable {}
