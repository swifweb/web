//
//  OptimumAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol OptimumAttrable: DOMElement {
    @discardableResult
    func optimum(_ value: Double) -> Self
    @discardableResult
    func optimum<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension OptimumAttrable {
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_optimum.asp)
    @discardableResult
    public func optimum(_ value: Double) -> Self {
        setAttribute("optimum", value)
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_optimum.asp)
    @discardableResult
    public func optimum<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        optimum(value.stateValue.wrappedValue)
        value.stateValue.listen { self.optimum($0) }
        return self
    }
}

extension Meter: OptimumAttrable {}
