//
//  HighAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol HighAttrable: DOMElement {
    @discardableResult
    func high(_ value: Double) -> Self
    @discardableResult
    func high<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension HighAttrable {
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high(_ value: Double) -> Self {
        setAttribute("high", value)
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

extension Meter: HighAttrable {}
