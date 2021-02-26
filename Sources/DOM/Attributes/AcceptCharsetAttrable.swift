//
//  AcceptCharsetAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AcceptCharsetAttrable: DOMElement {
    @discardableResult
    func acceptCharset(_ value: [String]) -> Self
    @discardableResult
    func acceptCharset(_ value: String...) -> Self
    @discardableResult
    func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String]
}

extension AcceptCharsetAttrable {
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    private func acceptCharset(value: String) -> Self {
        setAttribute("acceptCharset", value)
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

extension Form: AcceptCharsetAttrable {}
