//
//  HeadersAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol HeadersAttrable: DOMElement {
    @discardableResult
    func headers(_ value: String) -> Self
    @discardableResult
    func headers<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension HeadersAttrable {
    /// IDs of the `<th>` elements which applies to this element.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_headers.asp)
    @discardableResult
    public func headers(_ value: String) -> Self {
        setAttribute("headers", value)
        return self
    }
    
    /// IDs of the `<th>` elements which applies to this element.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_headers.asp)
    @discardableResult
    public func headers<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        headers(value.stateValue.wrappedValue)
        value.stateValue.listen { self.headers($0) }
        return self
    }
}

extension Td: HeadersAttrable {}
extension Th: HeadersAttrable{}
