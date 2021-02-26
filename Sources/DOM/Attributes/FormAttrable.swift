//
//  FormAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol FormAttrable: DOMElement {
    @discardableResult
    func form(_ value: String) -> Self
    @discardableResult
    func form(_ value: BaseElement) -> Self
    @discardableResult
    func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement
}

extension FormAttrable {
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form(_ value: String) -> Self {
        setAttribute("form", value)
        return self
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form(_ value: BaseElement) -> Self {
        form(value.properties._id)
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        form(value.stateValue.wrappedValue)
        value.stateValue.listen { self.form($0) }
        return self
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement {
        form(value.stateValue.wrappedValue)
        value.stateValue.listen { self.form($0) }
        return self
    }
}

extension Button: FormAttrable {}
extension FieldSet: FormAttrable {}
extension InputText: FormAttrable {}
extension InputTel: FormAttrable {}
extension InputEmail: FormAttrable {}
extension InputPassword: FormAttrable {}
extension InputSearch: FormAttrable {}
extension InputURL: FormAttrable {}
extension InputNumber: FormAttrable {}
extension InputRange: FormAttrable {}
extension InputImage: FormAttrable {}
extension InputButton: FormAttrable {}
extension InputSubmit: FormAttrable {}
extension InputReset: FormAttrable {}
extension InputHidden: FormAttrable {}
extension InputCheckbox: FormAttrable {}
extension InputRadio: FormAttrable {}
extension InputColor: FormAttrable {}
extension InputDateTime: FormAttrable {}
extension InputDate: FormAttrable {}
extension InputTime: FormAttrable {}
extension InputWeek: FormAttrable {}
extension InputMonth: FormAttrable {}
extension InputFile: FormAttrable {}
extension Label: FormAttrable {}
extension Meter: FormAttrable {}
extension Object: FormAttrable {}
extension Output: FormAttrable {}
extension Progress: FormAttrable {}
extension Select: FormAttrable {}
extension TextArea: FormAttrable {}
