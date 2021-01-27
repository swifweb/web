//
//  HighAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol HighAttrable {
    @discardableResult
    func high(_ value: Double) -> Self
    @discardableResult
    func high<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

protocol _HighAttrable: _AnyElement, HighAttrable {}

extension HighAttrable {
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high(_ value: Double) -> Self {
        guard let s = self as? _HighAttrable else { return self }
        s.setAttribute("high", value)
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        high(value.stateValue.wrappedValue)
        value.stateValue.listen { self.high($0) }
        return self
    }
}

extension Meter: _HighAttrable {}
