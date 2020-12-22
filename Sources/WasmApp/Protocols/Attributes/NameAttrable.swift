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
extension Input: _NameAttrable {}
extension Object: _NameAttrable {}
extension Output: _NameAttrable {}
extension Select: _NameAttrable {}
extension TextArea: _NameAttrable {}
extension Map: _NameAttrable {}
extension Meta: _NameAttrable {}
extension Param: _NameAttrable {}
