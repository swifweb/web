//
//  IntegrityAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol IntegrityAttrable: DOMElement {
    @discardableResult
    func integrity(_ value: String) -> Self
    @discardableResult
    func integrity<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension IntegrityAttrable {
    /// Specifies a Subresource Integrity value that allows browsers to verify what they fetch.
    ///
    /// Applicable to `<link>`, `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity)
    @discardableResult
    public func integrity(_ value: String) -> Self {
        setAttribute("integrity", value)
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

extension Link: IntegrityAttrable {}
extension Script: IntegrityAttrable {}
