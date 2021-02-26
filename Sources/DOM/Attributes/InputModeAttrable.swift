//
//  InputModeAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol InputModeAttrable: DOMElement {
    @discardableResult
    func inputMode(_ value: InputTextType) -> Self
    @discardableResult
    func inputMode<S>(_ value: S) -> Self where S: StateConvertible, S.Value == InputTextType
}

extension InputModeAttrable {
    /// Provides a hint as to the type of data that might be entered
    /// by the user while editing the element or its contents.
    /// The attribute can be used with form controls (such as the value of textarea elements),
    /// or in elements in an editing host (e.g., using contenteditable attribute).
    ///
    /// Applicable to `<textarea>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
    @discardableResult
    public func inputMode(_ value: InputTextType) -> Self {
        setAttribute("inputmode", value.value)
        return self
    }
    
    /// Provides a hint as to the type of data that might be entered
    /// by the user while editing the element or its contents.
    /// The attribute can be used with form controls (such as the value of textarea elements),
    /// or in elements in an editing host (e.g., using contenteditable attribute).
    ///
    /// Applicable to `<textarea>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
    @discardableResult
    public func inputMode<S>(_ value: S) -> Self where S: StateConvertible, S.Value == InputTextType {
        inputMode(value.stateValue.wrappedValue)
        value.stateValue.listen { self.inputMode($0) }
        return self
    }
}

extension InputText: InputModeAttrable {}
extension InputTel: InputModeAttrable {}
extension InputEmail: InputModeAttrable {}
extension InputPassword: InputModeAttrable {}
extension InputSearch: InputModeAttrable {}
extension InputURL: InputModeAttrable {}
extension InputNumber: InputModeAttrable {}
extension InputDateTime: InputModeAttrable {}
extension InputDate: InputModeAttrable {}
extension InputTime: InputModeAttrable {}
extension InputWeek: InputModeAttrable {}
extension InputMonth: InputModeAttrable {}
extension TextArea: InputModeAttrable {}
