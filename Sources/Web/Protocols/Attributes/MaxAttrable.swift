//
//  MaxAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MaxAttrable {
    @discardableResult
    func max(_ value: Double) -> Self
    @discardableResult
    func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

protocol _MaxAttrable: _AnyElement, MaxAttrable {}

extension MaxAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: Double) -> Self {
        guard let s = self as? _MaxAttrable else { return self }
        s.setAttribute("max", value)
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
extension Meter: _MaxAttrable {}
extension Progress: _MaxAttrable {}
extension InputNumber: _MaxAttrable {}
extension InputRange: _MaxAttrable {}

public protocol MaxDateAttrable {
    @discardableResult
    func max(_ value: String) -> Self
    @discardableResult
    func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _MaxDateAttrable: _AnyElement, MaxDateAttrable {}

extension MaxDateAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: String) -> Self {
        guard let s = self as? _MaxDateAttrable else { return self }
        s.setAttribute("max", value)
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
extension InputDateTime: _MaxDateAttrable {}
extension InputDate: _MaxDateAttrable {}
extension InputTime: _MaxDateAttrable {}
extension InputWeek: _MaxDateAttrable {}
extension InputMonth: _MaxDateAttrable {}
