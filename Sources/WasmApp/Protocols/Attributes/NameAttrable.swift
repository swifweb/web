//
//  NameAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol NameAttrable {
    @discardableResult
    func name(_ value: String) -> Self
    @discardableResult
    func name(_ value: State<String>) -> Self
    @discardableResult
    func name<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _NameAttrable: _AnyElement, NameAttrable {}

extension NameAttrable {
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to <button>, <form>, <fieldset>, <iframe>, <input>,
    /// <object>, <output>, <select>, <textarea>, <map>, <meta>, <param>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name(_ value: String) -> Self {
        guard let s = self as? _NameAttrable else { return self }
        s.domElement.name = value.jsValue()
        return self
    }
    
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to <button>, <form>, <fieldset>, <iframe>, <input>,
    /// <object>, <output>, <select>, <textarea>, <map>, <meta>, <param>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name(_ value: State<String>) -> Self {
        value.listen { self.name($0) }
        return self
    }
    
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to <button>, <form>, <fieldset>, <iframe>, <input>,
    /// <object>, <output>, <select>, <textarea>, <map>, <meta>, <param>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name<V>(_ expressable: ExpressableState<V, String>) -> Self {
        name(expressable.unwrap())
    }
}

extension Button: _NameAttrable {}
extension Form: _NameAttrable {}
extension FieldSet: _NameAttrable {}
extension IFrame: _NameAttrable {}
extension InputText: _NameAttrable {}
extension InputTel: _NameAttrable {}
extension InputEmail: _NameAttrable {}
extension InputPassword: _NameAttrable {}
extension InputSearch: _NameAttrable {}
extension InputURL: _NameAttrable {}
extension InputNumber: _NameAttrable {}
extension InputRange: _NameAttrable {}
extension InputImage: _NameAttrable {}
extension InputButton: _NameAttrable {}
extension InputSubmit: _NameAttrable {}
extension InputReset: _NameAttrable {}
extension InputHidden: _NameAttrable {}
extension InputCheckbox: _NameAttrable {}
extension InputRadio: _NameAttrable {}
extension InputColor: _NameAttrable {}
extension InputDateTime: _NameAttrable {}
extension InputDate: _NameAttrable {}
extension InputTime: _NameAttrable {}
extension InputWeek: _NameAttrable {}
extension InputMonth: _NameAttrable {}
extension InputFile: _NameAttrable {}
extension Object: _NameAttrable {}
extension Output: _NameAttrable {}
extension Select: _NameAttrable {}
extension TextArea: _NameAttrable {}
extension Map: _NameAttrable {}
extension Meta: _NameAttrable {}
extension Param: _NameAttrable {}
