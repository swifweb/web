//
//  CiteAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol CiteAttrable {
    @discardableResult
    func cite<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func cite<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

protocol _CiteAttrable: _AnyElement, CiteAttrable {}

extension CiteAttrable {
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to `<blockquote>`, `<del>`, `<ins>`, `<q>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite<U: URLConformable>(_ value: U) -> Self {
        guard let s = self as? _CiteAttrable else { return self }
        s.setAttribute("cite", value.stringValue)
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

extension BlockQuote: _CiteAttrable {}
extension Del: _CiteAttrable {}
extension Ins: _CiteAttrable {}
extension Q: _CiteAttrable {}
