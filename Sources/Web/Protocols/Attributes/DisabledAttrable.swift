//
//  DisabledAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol DisabledAttrable {
    @discardableResult
    func disabled(_ value: Bool) -> Self
    @discardableResult
    func disabled<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _DisabledAttrable: _AnyElement, DisabledAttrable {}

extension DisabledAttrable {
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled(_ value: Bool) -> Self {
        guard let s = self as? _DisabledAttrable else { return self }
        s.setAttribute("disabled", value, .short)
        return self
    }
    
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        disabled(value.stateValue.wrappedValue)
        value.stateValue.listen { self.disabled($0) }
        return self
    }
}

extension Button: _DisabledAttrable {}
extension FieldSet: _DisabledAttrable {}
extension InputText: _DisabledAttrable {}
extension InputTel: _DisabledAttrable {}
extension InputEmail: _DisabledAttrable {}
extension InputPassword: _DisabledAttrable {}
extension InputSearch: _DisabledAttrable {}
extension InputURL: _DisabledAttrable {}
extension InputNumber: _DisabledAttrable {}
extension InputRange: _DisabledAttrable {}
extension InputImage: _DisabledAttrable {}
extension InputButton: _DisabledAttrable {}
extension InputSubmit: _DisabledAttrable {}
extension InputReset: _DisabledAttrable {}
extension InputHidden: _DisabledAttrable {}
extension InputCheckbox: _DisabledAttrable {}
extension InputRadio: _DisabledAttrable {}
extension InputColor: _DisabledAttrable {}
extension InputDateTime: _DisabledAttrable {}
extension InputDate: _DisabledAttrable {}
extension InputTime: _DisabledAttrable {}
extension InputWeek: _DisabledAttrable {}
extension InputMonth: _DisabledAttrable {}
extension InputFile: _DisabledAttrable {}
extension OptGroup: _DisabledAttrable {}
extension Option: _DisabledAttrable {}
extension Select: _DisabledAttrable {}
extension Style: _DisabledAttrable {}
extension TextArea: _DisabledAttrable {}
