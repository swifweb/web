//
//  SelectedAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SelectedAttrable: DOMElement {
    @discardableResult
    func selected(_ value: Bool) -> Self
    @discardableResult
    func selected<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension SelectedAttrable {
    /// Defines a value which will be selected on page load.
    ///
    /// Applicable to `<option>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_selected.asp)
    @discardableResult
    public func selected(_ value: Bool) -> Self {
        setAttribute("selected", value, .short)
        return self
    }
    
    /// Defines a value which will be selected on page load.
    ///
    /// Applicable to `<option>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_selected.asp)
    @discardableResult
    public func selected<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        selected(value.stateValue.wrappedValue)
        value.stateValue.listen { self.selected($0) }
        return self
    }
}

extension Option: SelectedAttrable {}
