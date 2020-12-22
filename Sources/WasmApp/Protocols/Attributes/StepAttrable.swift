//
//  StepAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol StepAttrable {
    @discardableResult
    func step(_ value: Double) -> Self
    @discardableResult
    func step(_ value: State<Double>) -> Self
    @discardableResult
    func step<V>(_ expressable: ExpressableState<V, Double>) -> Self
}

protocol _StepAttrable: _AnyElement, StepAttrable {}

extension StepAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func step(_ value: Double) -> Self {
        guard let s = self as? _StepAttrable else { return self }
        s.domElement.step = value.jsValue()
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func step(_ value: State<Double>) -> Self {
        value.listen { self.step($0) }
        return self
    }
    
    /// The step attribute is a number that specifies the granularity
    /// that the value must adhere to or the keyword any.
    /// It is valid for the numeric input types,
    /// including the date, month, week, time, datetime-local, number and range types.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/step)
    @discardableResult
    public func step<V>(_ expressable: ExpressableState<V, Double>) -> Self {
        step(expressable.unwrap())
    }
}

extension Input: _StepAttrable {}
