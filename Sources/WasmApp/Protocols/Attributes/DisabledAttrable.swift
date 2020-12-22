//
//  DisabledAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DisabledAttrable {
    @discardableResult
    func disabled(_ value: Bool) -> Self
    @discardableResult
    func disabled(_ value: State<Bool>) -> Self
    @discardableResult
    func disabled<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _DisabledAttrable: _AnyElement, DisabledAttrable {}

extension DisabledAttrable {
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to <button>, <fieldset>, <input>, <keygen>, <optgroup>, <option>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled(_ value: Bool) -> Self {
        guard let s = self as? _DisabledAttrable else { return self }
        s.domElement.disabled = value.jsValue()
        return self
    }
    
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to <button>, <fieldset>, <input>, <keygen>, <optgroup>, <option>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled(_ value: State<Bool>) -> Self {
        value.listen { self.disabled($0) }
        return self
    }
    
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to <button>, <fieldset>, <input>, <keygen>, <optgroup>, <option>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        disabled(expressable.unwrap())
    }
}

extension Button: _DisabledAttrable {}
extension FieldSet: _DisabledAttrable {}
extension Input: _DisabledAttrable {}
extension OptGroup: _DisabledAttrable {}
extension Option: _DisabledAttrable {}
extension Select: _DisabledAttrable {}
extension TextArea: _DisabledAttrable {}
