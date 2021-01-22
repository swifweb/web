//
//  LowAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LowAttrable {
    @discardableResult
    func low(_ value: Double) -> Self
    @discardableResult
    func low<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

protocol _LowAttrable: _AnyElement, LowAttrable {}

extension LowAttrable {
    /// Indicates the upper bound of the lower range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_low.asp)
    @discardableResult
    public func low(_ value: Double) -> Self {
        guard let s = self as? _LowAttrable else { return self }
        s.domElement.low = value.jsValue()
        return self
    }
    
    /// Indicates the upper bound of the lower range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_low.asp)
    @discardableResult
    public func low<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        low(value.stateValue.wrappedValue)
        value.stateValue.listen { self.low($0) }
        return self
    }
}

extension Meter: _LowAttrable {}
