//
//  RequiredAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol RequiredAttrable {
    @discardableResult
    func required(_ value: Bool) -> Self
    @discardableResult
    func required(_ value: State<Bool>) -> Self
    @discardableResult
    func required<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _RequiredAttrable: _AnyElement, RequiredAttrable {}

extension RequiredAttrable {
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required(_ value: Bool) -> Self {
        guard let s = self as? _RequiredAttrable else { return self }
        s.domElement.required = value.jsValue()
        return self
    }
    
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required(_ value: State<Bool>) -> Self {
        value.listen { self.required($0) }
        return self
    }
    
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        required(expressable.unwrap())
    }
}

extension InputText: _RequiredAttrable {}
extension InputTel: _RequiredAttrable {}
extension InputEmail: _RequiredAttrable {}
extension InputPassword: _RequiredAttrable {}
extension InputSearch: _RequiredAttrable {}
extension InputURL: _RequiredAttrable {}
extension InputNumber: _RequiredAttrable {}
extension InputRange: _RequiredAttrable {}
extension InputImage: _RequiredAttrable {}
extension InputButton: _RequiredAttrable {}
extension InputSubmit: _RequiredAttrable {}
extension InputReset: _RequiredAttrable {}
extension InputHidden: _RequiredAttrable {}
extension InputCheckbox: _RequiredAttrable {}
extension InputRadio: _RequiredAttrable {}
extension InputColor: _RequiredAttrable {}
extension InputDateTime: _RequiredAttrable {}
extension InputDate: _RequiredAttrable {}
extension InputTime: _RequiredAttrable {}
extension InputWeek: _RequiredAttrable {}
extension InputMonth: _RequiredAttrable {}
extension InputFile: _RequiredAttrable {}
extension Select: _RequiredAttrable {}
extension TextArea: _RequiredAttrable {}
