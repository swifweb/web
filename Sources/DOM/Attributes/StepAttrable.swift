//
//  StepAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol StepAttrable: DOMElement {
    @discardableResult
    func step(_ value: Double) -> Self
    @discardableResult
    func step<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

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
        setAttribute("step", value)
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

extension InputNumber: StepAttrable {}
extension InputRange: StepAttrable {}
extension InputDateTime: StepAttrable {}
extension InputDate: StepAttrable {}
extension InputTime: StepAttrable {}
extension InputWeek: StepAttrable {}
extension InputMonth: StepAttrable {}
