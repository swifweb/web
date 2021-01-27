//
//  StepAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol StepAttrable {
    @discardableResult
    func step(_ value: Double) -> Self
    @discardableResult
    func step<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

protocol _StepAttrable: _AnyElement, StepAttrable {}

extension StepAttrable {
    /// The step attribute is a number that specifies the granularity
    /// that the value must adhere to or the keyword any.
    /// It is valid for the numeric input types,
    /// including the date, month, week, time, datetime-local, number and range types.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/step)
    @discardableResult
    public func step(_ value: Double) -> Self {
        guard let s = self as? _StepAttrable else { return self }
        s.setAttribute("step", value)
        return self
    }
    
    /// The step attribute is a number that specifies the granularity
    /// that the value must adhere to or the keyword any.
    /// It is valid for the numeric input types,
    /// including the date, month, week, time, datetime-local, number and range types.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/step)
    @discardableResult
    public func step<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        step(value.stateValue.wrappedValue)
        value.stateValue.listen { self.step($0) }
        return self
    }
}

extension InputNumber: _StepAttrable {}
extension InputRange: _StepAttrable {}
extension InputDateTime: _StepAttrable {}
extension InputDate: _StepAttrable {}
extension InputTime: _StepAttrable {}
extension InputWeek: _StepAttrable {}
extension InputMonth: _StepAttrable {}
