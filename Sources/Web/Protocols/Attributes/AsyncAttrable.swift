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
    func async(_ value: State<Bool>) -> Self
    @discardableResult
    func async<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _AsyncAttrable: _AnyElement, AsyncAttrable {}

extension AsyncAttrable {
    /// Executes the script asynchronously.
    ///
    /// Applicable to <script>
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
    /// Applicable to <script>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/async)
    @discardableResult
    public func async(_ value: State<Bool>) -> Self {
        value.listen { self.async($0) }
        return self
    }
    
    /// Executes the script asynchronously.
    ///
    /// Applicable to <script>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/async)
    @discardableResult
    public func async<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        async(expressable.unwrap())
    }
}

extension Script: _AsyncAttrable {}
