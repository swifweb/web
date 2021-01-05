//
//  AutofocusAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AutofocusAttrable {
    @discardableResult
    func autofocus(_ value: Bool) -> Self
    @discardableResult
    func autofocus(_ value: State<Bool>) -> Self
    @discardableResult
    func autofocus<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _AutofocusAttrable: _AnyElement, AutofocusAttrable {}

extension AutofocusAttrable {
    /// The element should be automatically focused after the page loaded.
    ///
    /// Applicable to <button>, <input>, <keygen>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautofocus)
    @discardableResult
    public func autofocus(_ value: Bool) -> Self {
        guard let s = self as? _AutofocusAttrable else { return self }
        s.domElement.autofocus = value.jsValue()
        return self
    }
    
    /// The element should be automatically focused after the page loaded.
    ///
    /// Applicable to <button>, <input>, <keygen>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautofocus)
    @discardableResult
    public func autofocus(_ value: State<Bool>) -> Self {
        value.listen { self.autofocus($0) }
        return self
    }
    
    /// The element should be automatically focused after the page loaded.
    ///
    /// Applicable to <button>, <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautofocus)
    @discardableResult
    public func autofocus<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        autofocus(expressable.unwrap())
    }
}

extension Button: _AutofocusAttrable {}
extension InputText: _AutofocusAttrable {}
extension InputTel: _AutofocusAttrable {}
extension InputEmail: _AutofocusAttrable {}
extension InputPassword: _AutofocusAttrable {}
extension InputSearch: _AutofocusAttrable {}
extension InputURL: _AutofocusAttrable {}
extension InputNumber: _AutofocusAttrable {}
extension InputRange: _AutofocusAttrable {}
extension InputImage: _AutofocusAttrable {}
extension InputButton: _AutofocusAttrable {}
extension InputSubmit: _AutofocusAttrable {}
extension InputReset: _AutofocusAttrable {}
extension InputHidden: _AutofocusAttrable {}
extension InputCheckbox: _AutofocusAttrable {}
extension InputRadio: _AutofocusAttrable {}
extension InputColor: _AutofocusAttrable {}
extension InputDateTime: _AutofocusAttrable {}
extension InputDate: _AutofocusAttrable {}
extension InputTime: _AutofocusAttrable {}
extension InputWeek: _AutofocusAttrable {}
extension InputMonth: _AutofocusAttrable {}
extension InputFile: _AutofocusAttrable {}
extension Select: _AutofocusAttrable {}
extension TextArea: _AutofocusAttrable {}
