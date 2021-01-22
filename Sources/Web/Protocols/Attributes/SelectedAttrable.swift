//
//  SelectedAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SelectedAttrable {
    @discardableResult
    func selected(_ value: Bool) -> Self
    @discardableResult
    func selected<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _SelectedAttrable: _AnyElement, SelectedAttrable {}

extension SelectedAttrable {
    /// Defines a value which will be selected on page load.
    ///
    /// Applicable to `<option>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_selected.asp)
    @discardableResult
    public func selected(_ value: Bool) -> Self {
        guard let s = self as? _SelectedAttrable else { return self }
        s.domElement.selected = value.jsValue()
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

extension Option: _SelectedAttrable {}
