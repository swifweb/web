//
//  MaxAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MaxAttrable: DOMElement {
    @discardableResult
    func max(_ value: Double) -> Self
    @discardableResult
    func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension MaxAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: Double) -> Self {
        setAttribute("max", value)
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        max(value.stateValue.wrappedValue)
        value.stateValue.listen { self.max($0) }
        return self
    }
}
extension Meter: MaxAttrable {}
extension Progress: MaxAttrable {}
extension InputNumber: MaxAttrable {}
extension InputRange: MaxAttrable {}

public protocol MaxDateAttrable: DOMElement {
    @discardableResult
    func max(_ value: String) -> Self
    @discardableResult
    func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension MaxDateAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: String) -> Self {
        setAttribute("max", value)
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        max(value.stateValue.wrappedValue)
        value.stateValue.listen { self.max($0) }
        return self
    }
}
extension InputDateTime: MaxDateAttrable {}
extension InputDate: MaxDateAttrable {}
extension InputTime: MaxDateAttrable {}
extension InputWeek: MaxDateAttrable {}
extension InputMonth: MaxDateAttrable {}
