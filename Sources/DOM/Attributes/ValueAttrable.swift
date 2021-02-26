//
//  ValueAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ValueAttrable: DOMElement {
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

extension ValueAttrable {
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value(_ value: Bool) -> Self {
        setAttribute("value", value ? "true" : "false")
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
        setAttribute("value", value)
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
        setAttribute("value", value)
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

extension Button: ValueAttrable {}
extension Data: ValueAttrable {}
extension InputText: ValueAttrable {}
extension InputTel: ValueAttrable {}
extension InputEmail: ValueAttrable {}
extension InputPassword: ValueAttrable {}
extension InputSearch: ValueAttrable {}
extension InputURL: ValueAttrable {}
extension InputNumber: ValueAttrable {}
extension InputRange: ValueAttrable {}
extension InputDateTime: ValueAttrable {}
extension InputDate: ValueAttrable {}
extension InputTime: ValueAttrable {}
extension InputWeek: ValueAttrable {}
extension InputMonth: ValueAttrable {}
extension InputColor: ValueAttrable {}
extension InputList: ValueAttrable {}
extension InputRadio: ValueAttrable {}
extension InputCheckbox: ValueAttrable {}
extension InputHidden: ValueAttrable {}
extension Li: ValueAttrable {}
extension Meter: ValueAttrable {}
extension Option: ValueAttrable {}
extension Progress: ValueAttrable {}
extension Param: ValueAttrable {}
