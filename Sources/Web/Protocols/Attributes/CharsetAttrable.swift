//
//  CharsetAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol CharsetAttrable {
    @discardableResult
    func charset(_ value: String) -> Self
    @discardableResult
    func charset(_ value: State<String>) -> Self
    @discardableResult
    func charset<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _CharsetAttrable: _AnyElement, CharsetAttrable {}

extension CharsetAttrable {
    /// This attribute declares the document's character encoding.
    /// If the attribute is present, its value must be an ASCII case-insensitive match for the string "utf-8",
    /// because UTF-8 is the only valid encoding for HTML5 documents.
    /// meta elements which declare a character encoding must be located
    /// entirely within the first 1024 bytes of the document.
    ///
    /// Applicable to <meta>, <script>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_charset.asp)
    @discardableResult
    public func charset(_ value: String) -> Self {
        guard let s = self as? _CharsetAttrable else { return self }
        s.domElement.charset = value.jsValue()
        return self
    }
    
    /// This attribute declares the document's character encoding.
    /// If the attribute is present, its value must be an ASCII case-insensitive match for the string "utf-8",
    /// because UTF-8 is the only valid encoding for HTML5 documents.
    /// meta elements which declare a character encoding must be located
    /// entirely within the first 1024 bytes of the document.
    ///
    /// Applicable to <meta>, <script>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_charset.asp)
    @discardableResult
    public func charset(_ value: State<String>) -> Self {
        value.listen { self.charset($0) }
        return self
    }
    
    /// This attribute declares the document's character encoding.
    /// If the attribute is present, its value must be an ASCII case-insensitive match for the string "utf-8",
    /// because UTF-8 is the only valid encoding for HTML5 documents.
    /// meta elements which declare a character encoding must be located
    /// entirely within the first 1024 bytes of the document.
    ///
    /// Applicable to <meta>, <script>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_charset.asp)
    @discardableResult
    public func charset<V>(_ expressable: ExpressableState<V, String>) -> Self {
        charset(expressable.unwrap())
    }
}

extension Meta: _CharsetAttrable {}
extension Script: _CharsetAttrable{}
