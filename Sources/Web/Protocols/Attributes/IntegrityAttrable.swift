//
//  IntegrityAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol IntegrityAttrable {
    @discardableResult
    func integrity(_ value: String) -> Self
    @discardableResult
    func integrity<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _IntegrityAttrable: _AnyElement, IntegrityAttrable {}

extension IntegrityAttrable {
    /// Specifies a Subresource Integrity value that allows browsers to verify what they fetch.
    ///
    /// Applicable to `<link>`, `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity)
    @discardableResult
    public func integrity(_ value: String) -> Self {
        guard let s = self as? _IntegrityAttrable else { return self }
        s.domElement.integrity = value.jsValue()
        return self
    }
    
    /// Specifies a Subresource Integrity value that allows browsers to verify what they fetch.
    ///
    /// Applicable to `<link>`, `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity)
    @discardableResult
    public func integrity<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        integrity(value.stateValue.wrappedValue)
        value.stateValue.listen { self.integrity($0) }
        return self
    }
}

extension Link: _IntegrityAttrable {}
extension Script: _IntegrityAttrable {}
