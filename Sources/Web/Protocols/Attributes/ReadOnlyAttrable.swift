//
//  ReadOnlyAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ReadOnlyAttrable {
    @discardableResult
    func readonly(_ value: Bool) -> Self
    @discardableResult
    func readonly<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _ReadOnlyAttrable: _AnyElement, ReadOnlyAttrable {}

extension ReadOnlyAttrable {
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly(_ value: Bool) -> Self {
        guard let s = self as? _ReadOnlyAttrable else { return self }
        s.setAttribute("readonly", value, .long)
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

extension InputText: _ReadOnlyAttrable {}
extension InputTel: _ReadOnlyAttrable {}
extension InputEmail: _ReadOnlyAttrable {}
extension InputPassword: _ReadOnlyAttrable {}
extension InputSearch: _ReadOnlyAttrable {}
extension InputURL: _ReadOnlyAttrable {}
extension InputNumber: _ReadOnlyAttrable {}
extension InputRange: _ReadOnlyAttrable {}
extension InputImage: _ReadOnlyAttrable {}
extension InputButton: _ReadOnlyAttrable {}
extension InputSubmit: _ReadOnlyAttrable {}
extension InputReset: _ReadOnlyAttrable {}
extension InputHidden: _ReadOnlyAttrable {}
extension InputCheckbox: _ReadOnlyAttrable {}
extension InputRadio: _ReadOnlyAttrable {}
extension InputColor: _ReadOnlyAttrable {}
extension InputDateTime: _ReadOnlyAttrable {}
extension InputDate: _ReadOnlyAttrable {}
extension InputTime: _ReadOnlyAttrable {}
extension InputWeek: _ReadOnlyAttrable {}
extension InputMonth: _ReadOnlyAttrable {}
extension InputFile: _ReadOnlyAttrable {}
extension TextArea: _ReadOnlyAttrable {}
