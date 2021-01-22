//
//  AsyncAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AsyncAttrable {
    @discardableResult
    func async(_ value: Bool) -> Self
    @discardableResult
    func async<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _AsyncAttrable: _AnyElement, AsyncAttrable {}

extension AsyncAttrable {
    /// Executes the script asynchronously.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/async)
    @discardableResult
    public func async(_ value: Bool) -> Self {
        guard let s = self as? _AsyncAttrable else { return self }
        s.domElement.async = value.jsValue()
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

extension Script: _AsyncAttrable {}
