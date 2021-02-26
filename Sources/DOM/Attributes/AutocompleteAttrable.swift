//
//  AutocompleteAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AutocompleteAttrable: DOMElement {
    @discardableResult
    func autocomplete(_ value: AutocompleteType) -> Self
    @discardableResult
    func autocomplete<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocompleteType
}

extension AutocompleteAttrable {
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to `<form>`, `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete(_ value: AutocompleteType) -> Self {
        setAttribute("autocapitalize", value.value)
        return self
    }
    
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to `<form>`, `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocompleteType {
        autocomplete(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autocomplete($0) }
        return self
    }
}

extension Form: AutocompleteAttrable {}
extension InputText: AutocompleteAttrable {}
extension InputTel: AutocompleteAttrable {}
extension InputEmail: AutocompleteAttrable {}
extension InputPassword: AutocompleteAttrable {}
extension InputSearch: AutocompleteAttrable {}
extension InputURL: AutocompleteAttrable {}
extension InputNumber: AutocompleteAttrable {}
extension InputDateTime: AutocompleteAttrable {}
extension InputDate: AutocompleteAttrable {}
extension InputTime: AutocompleteAttrable {}
extension InputWeek: AutocompleteAttrable {}
extension InputMonth: AutocompleteAttrable {}
extension Select: AutocompleteAttrable {}
extension TextArea: AutocompleteAttrable {}
