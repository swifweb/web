//
//  HttpEquivAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol HttpEquivAttrable: DOMElement {
    @discardableResult
    func httpEquiv(_ value: String) -> Self
    @discardableResult
    func httpEquiv<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension HttpEquivAttrable {
    /// Defines a pragma directive.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_http-equiv.asp)
    @discardableResult
    public func httpEquiv(_ value: String) -> Self {
        setAttribute("httpequiv", value)
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

extension Meta: HttpEquivAttrable {}
