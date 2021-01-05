//
//  PlaceholderAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol PlaceholderAttrable {
    @discardableResult
    func placeholder(_ value: String) -> Self
    @discardableResult
    func placeholder(_ value: State<String>) -> Self
    @discardableResult
    func placeholder<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _PlaceholderAttrable: _AnyElement, PlaceholderAttrable {}

extension PlaceholderAttrable {
    /// Provides a hint to the user of what can be entered in the field.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_placeholder.asp)
    @discardableResult
    public func placeholder(_ value: String) -> Self {
        guard let s = self as? _PlaceholderAttrable else { return self }
        s.domElement.placeholder = value.jsValue()
        return self
    }
    
    /// Provides a hint to the user of what can be entered in the field.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_placeholder.asp)
    @discardableResult
    public func placeholder(_ value: State<String>) -> Self {
        value.listen { self.placeholder($0) }
        return self
    }
    
    /// Provides a hint to the user of what can be entered in the field.
    ///
    /// Applicable to <input>, <textarea>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_placeholder.asp)
    @discardableResult
    public func placeholder<V>(_ expressable: ExpressableState<V, String>) -> Self {
        placeholder(expressable.unwrap())
    }
}

extension InputText: _PlaceholderAttrable {}
extension InputTel: _PlaceholderAttrable {}
extension InputEmail: _PlaceholderAttrable {}
extension InputPassword: _PlaceholderAttrable {}
extension InputSearch: _PlaceholderAttrable {}
extension InputURL: _PlaceholderAttrable {}
extension InputNumber: _PlaceholderAttrable {}
extension InputDateTime: _PlaceholderAttrable {}
extension InputDate: _PlaceholderAttrable {}
extension InputTime: _PlaceholderAttrable {}
extension InputWeek: _PlaceholderAttrable {}
extension InputMonth: _PlaceholderAttrable {}
extension TextArea: _PlaceholderAttrable {}
