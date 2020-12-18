//
//  ActionAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ActionAttrable {
    @discardableResult
    func accessKey(_ value: URLConformable) -> Self
    @discardableResult
    func accessKey(_ value: State<URLConformable>) -> Self
    @discardableResult
    func accessKey<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self
}

protocol _ActionAttrable: _AnyElement, ActionAttrable {}

extension ActionAttrable {
    /// Specifies where to send the form data when the form is submitted.
    ///
    /// Possible values:
    /// - An absolute URL - points to another web site (like action="http://www.example.com/example.htm")
    /// - A relative URL - points to a file within a web site (like action="example.htm")
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/action)
    @discardableResult
    public func accessKey(_ value: URLConformable) -> Self {
        guard let s = self as? _ActionAttrable else { return self }
        s.domElement.action = value.stringValue.jsValue()
        return self
    }
    
    /// Specifies where to send the form data when the form is submitted.
    ///
    /// Possible values:
    /// - An absolute URL - points to another web site (like action="http://www.example.com/example.htm")
    /// - A relative URL - points to a file within a web site (like action="example.htm")
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/action)
    @discardableResult
    public func accessKey(_ value: State<URLConformable>) -> Self {
        value.listen { self.accessKey($0) }
        return self
    }
    
    /// Specifies where to send the form data when the form is submitted.
    ///
    /// Possible values:
    /// - An absolute URL - points to another web site (like action="http://www.example.com/example.htm")
    /// - A relative URL - points to a file within a web site (like action="example.htm")
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/action)
    @discardableResult
    public func accessKey<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self {
        accessKey(expressable.unwrap())
    }
}

extension Form: _ActionAttrable {}
