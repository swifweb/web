//
//  DisabledAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol DisabledAttrable: DOMElement {
    @discardableResult
    func disabled(_ value: Bool) -> Self
    @discardableResult
    func disabled<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension DisabledAttrable {
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled(_ value: Bool) -> Self {
        setAttribute("disabled", value, .short)
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

extension Button: DisabledAttrable {}
extension FieldSet: DisabledAttrable {}
extension InputText: DisabledAttrable {}
extension InputTel: DisabledAttrable {}
extension InputEmail: DisabledAttrable {}
extension InputPassword: DisabledAttrable {}
extension InputSearch: DisabledAttrable {}
extension InputURL: DisabledAttrable {}
extension InputNumber: DisabledAttrable {}
extension InputRange: DisabledAttrable {}
extension InputImage: DisabledAttrable {}
extension InputButton: DisabledAttrable {}
extension InputSubmit: DisabledAttrable {}
extension InputReset: DisabledAttrable {}
extension InputHidden: DisabledAttrable {}
extension InputCheckbox: DisabledAttrable {}
extension InputRadio: DisabledAttrable {}
extension InputColor: DisabledAttrable {}
extension InputDateTime: DisabledAttrable {}
extension InputDate: DisabledAttrable {}
extension InputTime: DisabledAttrable {}
extension InputWeek: DisabledAttrable {}
extension InputMonth: DisabledAttrable {}
extension InputFile: DisabledAttrable {}
extension OptGroup: DisabledAttrable {}
extension Option: DisabledAttrable {}
extension Select: DisabledAttrable {}
extension Style: DisabledAttrable {}
extension TextArea: DisabledAttrable {}
