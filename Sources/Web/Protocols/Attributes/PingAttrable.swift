//
//  PingAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol PingAttrable {
    @discardableResult
    func ping(_ value: [URLConformable]) -> Self
    @discardableResult
    func ping(_ value: URLConformable...) -> Self
    @discardableResult
    func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
    @discardableResult
    func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [URLConformable]
}

protocol _PingAttrable: _AnyElement, PingAttrable {}

extension PingAttrable {
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    private func ping(value: URLConformable) -> Self {
        guard let s = self as? _AcceptAttrable else { return self }
        s.domElement.ping = value.stringValue.jsValue()
        return self
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping(_ value: [URLConformable]) -> Self {
        ping(value: value.map { $0.stringValue }.joined(separator: " "))
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping(_ value: URLConformable...) -> Self {
        ping(value)
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        ping(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.ping(value: $0) }
        return self
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [URLConformable] {
        ping(value.stateValue.wrappedValue)
        value.stateValue.listen { self.ping($0) }
        return self
    }
}

extension A: _PingAttrable {}
extension Area: _PingAttrable {}
