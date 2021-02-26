//
//  ReadOnlyAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ReadOnlyAttrable: DOMElement {
    @discardableResult
    func readonly(_ value: Bool) -> Self
    @discardableResult
    func readonly<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ReadOnlyAttrable {
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly(_ value: Bool) -> Self {
        setAttribute("readonly", value, .long)
        return self
    }
    
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        readonly(value.stateValue.wrappedValue)
        value.stateValue.listen { self.readonly($0) }
        return self
    }
}

extension InputText: ReadOnlyAttrable {}
extension InputTel: ReadOnlyAttrable {}
extension InputEmail: ReadOnlyAttrable {}
extension InputPassword: ReadOnlyAttrable {}
extension InputSearch: ReadOnlyAttrable {}
extension InputURL: ReadOnlyAttrable {}
extension InputNumber: ReadOnlyAttrable {}
extension InputRange: ReadOnlyAttrable {}
extension InputImage: ReadOnlyAttrable {}
extension InputButton: ReadOnlyAttrable {}
extension InputSubmit: ReadOnlyAttrable {}
extension InputReset: ReadOnlyAttrable {}
extension InputHidden: ReadOnlyAttrable {}
extension InputCheckbox: ReadOnlyAttrable {}
extension InputRadio: ReadOnlyAttrable {}
extension InputColor: ReadOnlyAttrable {}
extension InputDateTime: ReadOnlyAttrable {}
extension InputDate: ReadOnlyAttrable {}
extension InputTime: ReadOnlyAttrable {}
extension InputWeek: ReadOnlyAttrable {}
extension InputMonth: ReadOnlyAttrable {}
extension InputFile: ReadOnlyAttrable {}
extension TextArea: ReadOnlyAttrable {}
