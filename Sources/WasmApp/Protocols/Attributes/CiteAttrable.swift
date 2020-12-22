//
//  CiteAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol CiteAttrable {
    @discardableResult
    func cite(_ value: URLConformable) -> Self
    @discardableResult
    func cite(_ value: State<URLConformable>) -> Self
    @discardableResult
    func cite<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self
}

protocol _CiteAttrable: _AnyElement, CiteAttrable {}

extension CiteAttrable {
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to <blockquote>, <del>, <ins>, <q>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite(_ value: URLConformable) -> Self {
        guard let s = self as? _CiteAttrable else { return self }
        s.domElement.cite = value.stringValue.jsValue()
        return self
    }
    
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to <blockquote>, <del>, <ins>, <q>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite(_ value: State<URLConformable>) -> Self {
        value.listen { self.cite($0) }
        return self
    }
    
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to <blockquote>, <del>, <ins>, <q>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self {
        cite(expressable.unwrap())
    }
}

extension BlockQuote: _CiteAttrable {}
extension Del: _CiteAttrable {}
extension Ins: _CiteAttrable {}
extension Q: _CiteAttrable {}
