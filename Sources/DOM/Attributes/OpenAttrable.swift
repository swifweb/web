//
//  OpenAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol OpenAttrable: DOMElement {
    @discardableResult
    func open(_ value: Bool) -> Self
    @discardableResult
    func open<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension OpenAttrable {
    /// Indicates whether the details will be shown on page load.
    ///
    /// Applicable to `<details>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_open.asp)
    @discardableResult
    public func open(_ value: Bool) -> Self {
        setAttribute("open", value, .short)
        return self
    }
    
    /// Indicates whether the details will be shown on page load.
    ///
    /// Applicable to `<details>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_open.asp)
    @discardableResult
    public func open<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        open(value.stateValue.wrappedValue)
        value.stateValue.listen { self.open($0) }
        return self
    }
}

extension Details: OpenAttrable {}
