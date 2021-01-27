//
//  SandboxAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SandboxAttrable {
    @discardableResult
    func sandbox(_ value: Bool) -> Self
    @discardableResult
    func sandbox<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _SandboxAttrable: _AnyElement, SandboxAttrable {}

extension SandboxAttrable {
    /// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
    ///
    /// Applicable to `<iframe>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
    @discardableResult
    public func sandbox(_ value: Bool) -> Self {
        guard let s = self as? _SandboxAttrable else { return self }
        s.setAttribute("sandbox", value, .short)
        return self
    }
    
    /// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
    ///
    /// Applicable to `<iframe>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
    @discardableResult
    public func sandbox<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        sandbox(value.stateValue.wrappedValue)
        value.stateValue.listen { self.sandbox($0) }
        return self
    }
}

extension IFrame: _SandboxAttrable {}
