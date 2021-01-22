//
//  HttpEquivAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HttpEquivAttrable {
    @discardableResult
    func httpEquiv(_ value: String) -> Self
    @discardableResult
    func httpEquiv<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _HttpEquivAttrable: _AnyElement, HttpEquivAttrable {}

extension HttpEquivAttrable {
    /// Defines a pragma directive.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_http-equiv.asp)
    @discardableResult
    public func httpEquiv(_ value: String) -> Self {
        guard let s = self as? _HttpEquivAttrable else { return self }
        s.domElement.httpequiv = value.jsValue()
        return self
    }
    
    /// Defines a pragma directive.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_http-equiv.asp)
    @discardableResult
    public func httpEquiv<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        httpEquiv(value.stateValue.wrappedValue)
        value.stateValue.listen { self.httpEquiv($0) }
        return self
    }
}

extension Meta: _HttpEquivAttrable {}
