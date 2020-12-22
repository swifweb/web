//
//  SandboxAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SandboxAttrable {
    @discardableResult
    func sandbox(_ value: Bool) -> Self
    @discardableResult
    func sandbox(_ value: State<Bool>) -> Self
    @discardableResult
    func sandbox<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _SandboxAttrable: _AnyElement, SandboxAttrable {}

extension SandboxAttrable {
    /// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
    ///
    /// Applicable to <iframe>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
    @discardableResult
    public func sandbox(_ value: Bool) -> Self {
        guard let s = self as? _SandboxAttrable else { return self }
        s.domElement.sandbox = value.jsValue()
        return self
    }
    
    /// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
    ///
    /// Applicable to <iframe>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
    @discardableResult
    public func sandbox(_ value: State<Bool>) -> Self {
        value.listen { self.sandbox($0) }
        return self
    }
    
    /// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
    ///
    /// Applicable to <iframe>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
    @discardableResult
    public func sandbox<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        sandbox(expressable.unwrap())
    }
}

extension IFrame: _SandboxAttrable {}
