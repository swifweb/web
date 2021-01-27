//
//  NameAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol NameAttrable {
    @discardableResult
    func name(_ value: String) -> Self
    @discardableResult
    func name<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _NameAttrable: _AnyElement, NameAttrable {}

extension NameAttrable {
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to `<button>`, `<form>`, `<fieldset>`, `<iframe>`, `<input>`,
    /// `<object>`, `<output>`, `<select>`, `<textarea>`, `<map>`, `<meta>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name(_ value: String) -> Self {
        guard let s = self as? _NameAttrable else { return self }
        s.setAttribute("name", value)
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

extension Button: _NameAttrable {}
extension Form: _NameAttrable {}
extension FieldSet: _NameAttrable {}
extension IFrame: _NameAttrable {}
extension InputText: _NameAttrable {}
extension InputTel: _NameAttrable {}
extension InputEmail: _NameAttrable {}
extension InputPassword: _NameAttrable {}
extension InputSearch: _NameAttrable {}
extension InputURL: _NameAttrable {}
extension InputNumber: _NameAttrable {}
extension InputRange: _NameAttrable {}
extension InputImage: _NameAttrable {}
extension InputButton: _NameAttrable {}
extension InputSubmit: _NameAttrable {}
extension InputReset: _NameAttrable {}
extension InputHidden: _NameAttrable {}
extension InputCheckbox: _NameAttrable {}
extension InputRadio: _NameAttrable {}
extension InputColor: _NameAttrable {}
extension InputDateTime: _NameAttrable {}
extension InputDate: _NameAttrable {}
extension InputTime: _NameAttrable {}
extension InputWeek: _NameAttrable {}
extension InputMonth: _NameAttrable {}
extension InputFile: _NameAttrable {}
extension Object: _NameAttrable {}
extension Output: _NameAttrable {}
extension Select: _NameAttrable {}
extension TextArea: _NameAttrable {}
extension Map: _NameAttrable {}
extension Meta: _NameAttrable {}
extension Param: _NameAttrable {}
