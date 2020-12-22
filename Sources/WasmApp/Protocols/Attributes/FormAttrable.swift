//
//  FormAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol FormAttrable {
    @discardableResult
    func form(_ value: String) -> Self
    @discardableResult
    func form(_ value: BaseElement) -> Self
    @discardableResult
    func form(_ value: State<String>) -> Self
    @discardableResult
    func form<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _FormAttrable: _AnyElement, FormAttrable {}

extension FormAttrable {
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to <button>, <fieldset>, <input>, <label>, <meter>, <object>, <output>, <progress>, <select>, <textarea>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form(_ value: String) -> Self {
        guard let s = self as? _FormAttrable else { return self }
        s.domElement.form = value.jsValue()
        return self
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to <button>, <fieldset>, <input>, <label>, <meter>, <object>, <output>, <progress>, <select>, <textarea>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form(_ value: BaseElement) -> Self {
        form(value.uid)
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to <button>, <fieldset>, <input>, <label>, <meter>, <object>, <output>, <progress>, <select>, <textarea>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form(_ value: State<String>) -> Self {
        value.listen { self.form($0) }
        return self
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to <button>, <fieldset>, <input>, <label>, <meter>, <object>, <output>, <progress>, <select>, <textarea>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form<V>(_ expressable: ExpressableState<V, String>) -> Self {
        form(expressable.unwrap())
    }
}

extension Button: _FormAttrable {}
extension FieldSet: _FormAttrable {}
extension Input: _FormAttrable {}
extension Label: _FormAttrable {}
extension Meter: _FormAttrable {}
extension Object: _FormAttrable {}
extension Output: _FormAttrable {}
extension Progress: _FormAttrable {}
extension Select: _FormAttrable {}
extension TextArea: _FormAttrable {}
