//
//  AcceptCharsetAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AcceptCharsetAttrable {
    @discardableResult
    func acceptCharset(_ value: [String]) -> Self
    @discardableResult
    func acceptCharset(_ value: String...) -> Self
    @discardableResult
    func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String]
}

protocol _AcceptCharsetAttrable: _AnyElement, AcceptCharsetAttrable {}

extension AcceptCharsetAttrable {
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    private func acceptCharset(value: String) -> Self {
        guard let s = self as? _AcceptCharsetAttrable else { return self }
        s.domElement.acceptCharset = value.jsValue()
        return self
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: [String]) -> Self {
        acceptCharset(value: value.joined(separator: ","))
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: String...) -> Self {
        acceptCharset(value)
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        acceptCharset(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.acceptCharset(value: $0) }
        return self
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String] {
        acceptCharset(value.stateValue.wrappedValue)
        value.stateValue.listen { self.acceptCharset($0) }
        return self
    }
}

extension Form: _AcceptCharsetAttrable {}
