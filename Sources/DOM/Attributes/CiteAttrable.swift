//
//  CiteAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol CiteAttrable: DOMElement {
    @discardableResult
    func cite<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func cite<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension CiteAttrable {
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to `<blockquote>`, `<del>`, `<ins>`, `<q>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite<U: URLConformable>(_ value: U) -> Self {
        setAttribute("cite", value.stringValue)
        return self
    }
    
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to `<blockquote>`, `<del>`, `<ins>`, `<q>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        cite(value.stateValue.wrappedValue)
        value.stateValue.listen { self.cite($0) }
        return self
    }
}

extension BlockQuote: CiteAttrable {}
extension Del: CiteAttrable {}
extension Ins: CiteAttrable {}
extension Q: CiteAttrable {}
