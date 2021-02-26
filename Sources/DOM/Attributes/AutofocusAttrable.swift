//
//  AutofocusAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AutofocusAttrable: DOMElement {
    @discardableResult
    func autofocus(_ value: Bool) -> Self
    @discardableResult
    func autofocus<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension AutofocusAttrable {
    /// The element should be automatically focused after the page loaded.
    ///
    /// Applicable to `<button>`, `<input>`, `<keygen>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautofocus)
    @discardableResult
    public func autofocus(_ value: Bool) -> Self {
        setAttribute("autofocus", value, .short)
        return self
    }
    
    /// The element should be automatically focused after the page loaded.
    ///
    /// Applicable to `<button>`, `<input>`, `<keygen>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautofocus)
    @discardableResult
    public func autofocus<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        autofocus(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autofocus($0) }
        return self
    }
}

extension Button: AutofocusAttrable {}
extension InputText: AutofocusAttrable {}
extension InputTel: AutofocusAttrable {}
extension InputEmail: AutofocusAttrable {}
extension InputPassword: AutofocusAttrable {}
extension InputSearch: AutofocusAttrable {}
extension InputURL: AutofocusAttrable {}
extension InputNumber: AutofocusAttrable {}
extension InputRange: AutofocusAttrable {}
extension InputImage: AutofocusAttrable {}
extension InputButton: AutofocusAttrable {}
extension InputSubmit: AutofocusAttrable {}
extension InputReset: AutofocusAttrable {}
extension InputHidden: AutofocusAttrable {}
extension InputCheckbox: AutofocusAttrable {}
extension InputRadio: AutofocusAttrable {}
extension InputColor: AutofocusAttrable {}
extension InputDateTime: AutofocusAttrable {}
extension InputDate: AutofocusAttrable {}
extension InputTime: AutofocusAttrable {}
extension InputWeek: AutofocusAttrable {}
extension InputMonth: AutofocusAttrable {}
extension InputFile: AutofocusAttrable {}
extension Select: AutofocusAttrable {}
extension TextArea: AutofocusAttrable {}
