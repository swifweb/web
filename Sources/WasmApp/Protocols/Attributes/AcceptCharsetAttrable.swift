//
//  AcceptCharsetAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AcceptCharsetAttrable {
    @discardableResult
    func acceptCharset(_ value: String) -> Self
    @discardableResult
    func acceptCharset(_ value: [String]) -> Self
    @discardableResult
    func acceptCharset(_ value: String...) -> Self
    @discardableResult
    func acceptCharset(_ value: State<String>) -> Self
    @discardableResult
    func acceptCharset<V>(_ expressable: ExpressableState<V, String>) -> Self
    @discardableResult
    func acceptCharset(_ value: State<[String]>) -> Self
    @discardableResult
    func acceptCharset<V>(_ expressable: ExpressableState<V, [String]>) -> Self
}

protocol _AcceptCharsetAttrable: _AnyElement, AcceptCharsetAttrable {}

extension AcceptCharsetAttrable {
    /// List of supported charsets.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: String) -> Self {
        guard let s = self as? _AcceptCharsetAttrable else { return self }
        s.domElement.acceptCharset = value.jsValue()
        return self
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: [String]) -> Self {
        acceptCharset(value.joined(separator: ","))
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: String...) -> Self {
        acceptCharset(value)
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: State<String>) -> Self {
        value.listen { self.acceptCharset($0) }
        return self
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset<V>(_ expressable: ExpressableState<V, String>) -> Self {
        acceptCharset(expressable.unwrap())
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: State<[String]>) -> Self {
        value.listen { self.acceptCharset($0) }
        return self
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset<V>(_ expressable: ExpressableState<V, [String]>) -> Self {
        acceptCharset(expressable.unwrap())
    }
}

extension Form: _AcceptCharsetAttrable {}
