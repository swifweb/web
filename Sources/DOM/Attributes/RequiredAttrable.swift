//
//  RequiredAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol RequiredAttrable: DOMElement {
    @discardableResult
    func required(_ value: Bool) -> Self
    @discardableResult
    func required<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension RequiredAttrable {
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required(_ value: Bool) -> Self {
        setAttribute("required", value, .long)
        return self
    }
    
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        required(value.stateValue.wrappedValue)
        value.stateValue.listen { self.required($0) }
        return self
    }
}

extension InputText: RequiredAttrable {}
extension InputTel: RequiredAttrable {}
extension InputEmail: RequiredAttrable {}
extension InputPassword: RequiredAttrable {}
extension InputSearch: RequiredAttrable {}
extension InputURL: RequiredAttrable {}
extension InputNumber: RequiredAttrable {}
extension InputRange: RequiredAttrable {}
extension InputImage: RequiredAttrable {}
extension InputButton: RequiredAttrable {}
extension InputSubmit: RequiredAttrable {}
extension InputReset: RequiredAttrable {}
extension InputHidden: RequiredAttrable {}
extension InputCheckbox: RequiredAttrable {}
extension InputRadio: RequiredAttrable {}
extension InputColor: RequiredAttrable {}
extension InputDateTime: RequiredAttrable {}
extension InputDate: RequiredAttrable {}
extension InputTime: RequiredAttrable {}
extension InputWeek: RequiredAttrable {}
extension InputMonth: RequiredAttrable {}
extension InputFile: RequiredAttrable {}
extension Select: RequiredAttrable {}
extension TextArea: RequiredAttrable {}
