//
//  ValueAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ValueAttrable {
    @discardableResult
    func value(_ value: Bool) -> Self
    @discardableResult
    func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
    
    @discardableResult
    func value(_ value: Double) -> Self
    @discardableResult
    func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
    
    @discardableResult
    func value(_ value: String) -> Self
    @discardableResult
    func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _ValueAttrable: _AnyElement, ValueAttrable {}

extension ValueAttrable {
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value(_ value: Bool) -> Self {
        guard let s = self as? _ValueAttrable else { return self }
        s.domElement.value = value ? "true".jsValue() : "false".jsValue()
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        self.value(value.stateValue.wrappedValue)
        value.stateValue.listen { self.value($0) }
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value(_ value: Double) -> Self {
        guard let s = self as? _ValueAttrable else { return self }
        s.domElement.value = value.jsValue()
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        self.value(value.stateValue.wrappedValue)
        value.stateValue.listen { self.value($0) }
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value(_ value: String) -> Self {
        guard let s = self as? _ValueAttrable else { return self }
        s.domElement.value = value.jsValue()
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        self.value(value.stateValue.wrappedValue)
        value.stateValue.listen { self.value($0) }
        return self
    }
}

extension Button: _ValueAttrable {}
extension Data: _ValueAttrable {}
extension InputText: _ValueAttrable {}
extension InputTel: _ValueAttrable {}
extension InputEmail: _ValueAttrable {}
extension InputPassword: _ValueAttrable {}
extension InputSearch: _ValueAttrable {}
extension InputURL: _ValueAttrable {}
extension InputNumber: _ValueAttrable {}
extension InputRange: _ValueAttrable {}
extension InputDateTime: _ValueAttrable {}
extension InputDate: _ValueAttrable {}
extension InputTime: _ValueAttrable {}
extension InputWeek: _ValueAttrable {}
extension InputMonth: _ValueAttrable {}
extension InputColor: _ValueAttrable {}
extension InputList: _ValueAttrable {}
extension InputRadio: _ValueAttrable {}
extension InputCheckbox: _ValueAttrable {}
extension InputHidden: _ValueAttrable {}
extension Li: _ValueAttrable {}
extension Meter: _ValueAttrable {}
extension Option: _ValueAttrable {}
extension Progress: _ValueAttrable {}
extension Param: _ValueAttrable {}
