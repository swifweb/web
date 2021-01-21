//
//  InputModeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol InputModeAttrable {
    @discardableResult
    func inputMode(_ value: InputTextType) -> Self
    @discardableResult
    func inputMode(_ value: State<InputTextType>) -> Self
    @discardableResult
    func inputMode<V>(_ expressable: ExpressableState<V, InputTextType>) -> Self
}

protocol _InputModeAttrable: _AnyElement, InputModeAttrable {}

extension InputModeAttrable {
    /// Provides a hint as to the type of data that might be entered
    /// by the user while editing the element or its contents.
    /// The attribute can be used with form controls (such as the value of textarea elements),
    /// or in elements in an editing host (e.g., using contenteditable attribute).
    ///
    /// Applicable to <textarea>, <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
    @discardableResult
    public func inputMode(_ value: InputTextType) -> Self {
        guard let s = self as? _InputModeAttrable else { return self }
        s.domElement.inputmode = value.value.jsValue()
        return self
    }
    
    /// Provides a hint as to the type of data that might be entered
    /// by the user while editing the element or its contents.
    /// The attribute can be used with form controls (such as the value of textarea elements),
    /// or in elements in an editing host (e.g., using contenteditable attribute).
    ///
    /// Applicable to <textarea>, <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
    @discardableResult
    public func inputMode(_ value: State<InputTextType>) -> Self {
        value.listen { self.inputMode($0) }
        return self
    }
    
    /// Provides a hint as to the type of data that might be entered
    /// by the user while editing the element or its contents.
    /// The attribute can be used with form controls (such as the value of textarea elements),
    /// or in elements in an editing host (e.g., using contenteditable attribute).
    ///
    /// Applicable to <textarea>, <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
    @discardableResult
    public func inputMode<V>(_ expressable: ExpressableState<V, InputTextType>) -> Self {
        inputMode(expressable.unwrap())
    }
}

extension InputText: _InputModeAttrable {}
extension InputTel: _InputModeAttrable {}
extension InputEmail: _InputModeAttrable {}
extension InputPassword: _InputModeAttrable {}
extension InputSearch: _InputModeAttrable {}
extension InputURL: _InputModeAttrable {}
extension InputNumber: _InputModeAttrable {}
extension InputDateTime: _InputModeAttrable {}
extension InputDate: _InputModeAttrable {}
extension InputTime: _InputModeAttrable {}
extension InputWeek: _InputModeAttrable {}
extension InputMonth: _InputModeAttrable {}
extension TextArea: _InputModeAttrable {}
