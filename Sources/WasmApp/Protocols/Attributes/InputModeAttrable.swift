//
//  InputModeAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol InputModeAttrable {
    @discardableResult
    func inputMode(_ value: InputModeType) -> Self
    @discardableResult
    func inputMode(_ value: State<InputModeType>) -> Self
    @discardableResult
    func inputMode<V>(_ expressable: ExpressableState<V, InputModeType>) -> Self
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
    public func inputMode(_ value: InputModeType) -> Self {
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
    public func inputMode(_ value: State<InputModeType>) -> Self {
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
    public func inputMode<V>(_ expressable: ExpressableState<V, InputModeType>) -> Self {
        inputMode(expressable.unwrap())
    }
}

extension Input: _InputModeAttrable {}
extension TextArea: _InputModeAttrable {}
