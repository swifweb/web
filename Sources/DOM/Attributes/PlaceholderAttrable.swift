//
//  PlaceholderAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol PlaceholderAttrable: DOMElement {
    @discardableResult
    func placeholder(_ value: String) -> Self
    @discardableResult
    func placeholder<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension PlaceholderAttrable {
    /// Provides a hint to the user of what can be entered in the field.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_placeholder.asp)
    @discardableResult
    public func placeholder(_ value: String) -> Self {
        setAttribute("placeholder", value)
        return self
    }
    
    /// Provides a hint to the user of what can be entered in the field.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_placeholder.asp)
    @discardableResult
    public func placeholder<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        placeholder(value.stateValue.wrappedValue)
        value.stateValue.listen { self.placeholder($0) }
        return self
    }
}

extension InputText: PlaceholderAttrable {}
extension InputTel: PlaceholderAttrable {}
extension InputEmail: PlaceholderAttrable {}
extension InputPassword: PlaceholderAttrable {}
extension InputSearch: PlaceholderAttrable {}
extension InputURL: PlaceholderAttrable {}
extension InputNumber: PlaceholderAttrable {}
extension InputDateTime: PlaceholderAttrable {}
extension InputDate: PlaceholderAttrable {}
extension InputTime: PlaceholderAttrable {}
extension InputWeek: PlaceholderAttrable {}
extension InputMonth: PlaceholderAttrable {}
extension TextArea: PlaceholderAttrable {}
