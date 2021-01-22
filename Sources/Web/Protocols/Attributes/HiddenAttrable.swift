//
//  HiddenAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HiddenAttrable {
    @discardableResult
    func hidden(_ value: Bool) -> Self
    @discardableResult
    func hidden<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _HiddenAttrable: _AnyElement, HiddenAttrable {}

extension HiddenAttrable {
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden(_ value: Bool) -> Self {
        guard let s = self as? _HiddenAttrable else { return self }
        s.domElement.hidden = value.jsValue()
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

extension BaseElement: _HiddenAttrable {}
