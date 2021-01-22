//
//  WrapAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol WrapAttrable {
    @discardableResult
    func wrap(_ value: WrapType) -> Self
    @discardableResult
    func wrap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == WrapType
}

protocol _WrapAttrable: _AnyElement, WrapAttrable {}

extension WrapAttrable {
    /// Indicates how the control wraps text.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
    @discardableResult
    public func wrap(_ value: WrapType) -> Self {
        guard let s = self as? _WrapAttrable else { return self }
        s.domElement.wrap = value.value.jsValue()
        return self
    }
    
    /// Indicates how the control wraps text.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
    @discardableResult
    public func wrap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == WrapType {
        wrap(value.stateValue.wrappedValue)
        value.stateValue.listen { self.wrap($0) }
        return self
    }
}

extension TextArea: _WrapAttrable {}
