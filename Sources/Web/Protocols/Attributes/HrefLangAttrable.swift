//
//  HrefLangAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol HrefLangAttrable {
    @discardableResult
    func hrefLang(_ value: String) -> Self
    @discardableResult
    func hrefLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _HrefLangAttrable: _AnyElement, HrefLangAttrable {}

extension HrefLangAttrable {
    /// Specifies the language of the linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hreflang.asp)
    @discardableResult
    public func hrefLang(_ value: String) -> Self {
        guard let s = self as? _HrefLangAttrable else { return self }
        s.domElement.hreflang = value.jsValue()
        return self
    }
    
    /// Specifies the language of the linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hreflang.asp)
    @discardableResult
    public func hrefLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        hrefLang(value.stateValue.wrappedValue)
        value.stateValue.listen { self.hrefLang($0) }
        return self
    }
}

extension A: _HrefLangAttrable {}
extension Area: _HrefLangAttrable {}
extension Link: _HrefLangAttrable {}