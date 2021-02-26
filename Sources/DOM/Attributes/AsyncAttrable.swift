//
//  AsyncAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AsyncAttrable: DOMElement {
    @discardableResult
    func async(_ value: Bool) -> Self
    @discardableResult
    func async<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension AsyncAttrable {
    /// Executes the script asynchronously.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_script_async.asp)
    @discardableResult
    public func async(_ value: Bool) -> Self {
        setAttribute("async", value, .short)
        return self
    }
    
    /// Executes the script asynchronously.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/async)
    @discardableResult
    public func async<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        async(value.stateValue.wrappedValue)
        value.stateValue.listen { self.async($0) }
        return self
    }
}

extension Script: AsyncAttrable {}
