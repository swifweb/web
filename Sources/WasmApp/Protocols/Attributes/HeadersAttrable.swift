//
//  HeadersAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HeadersAttrable {
    @discardableResult
    func headers(_ value: String) -> Self
    @discardableResult
    func headers(_ value: State<String>) -> Self
    @discardableResult
    func headers<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _HeadersAttrable: _AnyElement, HeadersAttrable {}

extension HeadersAttrable {
    /// IDs of the <th> elements which applies to this element.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_headers.asp)
    @discardableResult
    public func headers(_ value: String) -> Self {
        guard let s = self as? _HeadersAttrable else { return self }
        s.domElement.headers = value.jsValue()
        return self
    }
    
    /// IDs of the <th> elements which applies to this element.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_headers.asp)
    @discardableResult
    public func headers(_ value: State<String>) -> Self {
        value.listen { self.headers($0) }
        return self
    }
    
    /// IDs of the <th> elements which applies to this element.
    ///
    /// Applicable to <td>, <th>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_headers.asp)
    @discardableResult
    public func headers<V>(_ expressable: ExpressableState<V, String>) -> Self {
        headers(expressable.unwrap())
    }
}

extension Td: _HeadersAttrable {}
extension Th: _HeadersAttrable{}
