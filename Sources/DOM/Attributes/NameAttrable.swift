//
//  NameAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol NameAttrable: DOMElement {
    @discardableResult
    func name(_ value: String) -> Self
    @discardableResult
    func name<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension NameAttrable {
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to `<button>`, `<form>`, `<fieldset>`, `<iframe>`, `<input>`,
    /// `<object>`, `<output>`, `<select>`, `<textarea>`, `<map>`, `<meta>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name(_ value: String) -> Self {
        setAttribute("name", value)
        return self
    }
    
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to `<button>`, `<form>`, `<fieldset>`, `<iframe>`, `<input>`,
    /// `<object>`, `<output>`, `<select>`, `<textarea>`, `<map>`, `<meta>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        name(value.stateValue.wrappedValue)
        value.stateValue.listen { self.name($0) }
        return self
    }
}

extension Button: NameAttrable {}
extension Form: NameAttrable {}
extension FieldSet: NameAttrable {}
extension IFrame: NameAttrable {}
extension InputText: NameAttrable {}
extension InputTel: NameAttrable {}
extension InputEmail: NameAttrable {}
extension InputPassword: NameAttrable {}
extension InputSearch: NameAttrable {}
extension InputURL: NameAttrable {}
extension InputNumber: NameAttrable {}
extension InputRange: NameAttrable {}
extension InputImage: NameAttrable {}
extension InputButton: NameAttrable {}
extension InputSubmit: NameAttrable {}
extension InputReset: NameAttrable {}
extension InputHidden: NameAttrable {}
extension InputCheckbox: NameAttrable {}
extension InputRadio: NameAttrable {}
extension InputColor: NameAttrable {}
extension InputDateTime: NameAttrable {}
extension InputDate: NameAttrable {}
extension InputTime: NameAttrable {}
extension InputWeek: NameAttrable {}
extension InputMonth: NameAttrable {}
extension InputFile: NameAttrable {}
extension Object: NameAttrable {}
extension Output: NameAttrable {}
extension Select: NameAttrable {}
extension TextArea: NameAttrable {}
extension Map: NameAttrable {}
extension Meta: NameAttrable {}
extension Param: NameAttrable {}
