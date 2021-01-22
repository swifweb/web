//
//  AutocompleteAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AutocompleteAttrable {
    @discardableResult
    func autocomplete(_ value: AutocompleteType) -> Self
    @discardableResult
    func autocomplete<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocompleteType
}

protocol _AutocompleteAttrable: _AnyElement, AutocompleteAttrable {}

extension AutocompleteAttrable {
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to `<form>`, `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete(_ value: AutocompleteType) -> Self {
        guard let s = self as? _AutocompleteAttrable else { return self }
        s.domElement.autocapitalize = value.value.jsValue()
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

extension Form: _AutocompleteAttrable {}
extension InputText: _AutocompleteAttrable {}
extension InputTel: _AutocompleteAttrable {}
extension InputEmail: _AutocompleteAttrable {}
extension InputPassword: _AutocompleteAttrable {}
extension InputSearch: _AutocompleteAttrable {}
extension InputURL: _AutocompleteAttrable {}
extension InputNumber: _AutocompleteAttrable {}
extension InputDateTime: _AutocompleteAttrable {}
extension InputDate: _AutocompleteAttrable {}
extension InputTime: _AutocompleteAttrable {}
extension InputWeek: _AutocompleteAttrable {}
extension InputMonth: _AutocompleteAttrable {}
extension Select: _AutocompleteAttrable {}
extension TextArea: _AutocompleteAttrable {}
