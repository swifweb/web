//
//  HiddenAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol HiddenAttrable: DOMElement {
    @discardableResult
    func hidden(_ value: Bool) -> Self
    @discardableResult
    func hidden<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension HiddenAttrable {
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden(_ value: Bool) -> Self {
        setAttribute("hidden", value, .short)
        return self
    }
    
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        hidden(value.stateValue.wrappedValue)
        value.stateValue.listen { self.hidden($0) }
        return self
    }
}

extension BaseElement: HiddenAttrable {}
