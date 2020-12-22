//
//  TranslateAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol TranslateAttrable {
    @discardableResult
    func translate(_ value: Bool) -> Self
    @discardableResult
    func translate(_ value: State<Bool>) -> Self
    @discardableResult
    func translate<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _TranslateAttrable: _AnyElement, TranslateAttrable {}

extension TranslateAttrable {
    /// Specify whether an element’s attribute values and the values
    /// of its Text node children are to be translated when the page is localized, or whether to leave them unchanged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/translate)
    @discardableResult
    public func translate(_ value: Bool) -> Self {
        guard let s = self as? _TranslateAttrable else { return self }
        s.domElement.translate = value ? "yes".jsValue() : "no".jsValue()
        return self
    }
    
    /// Specify whether an element’s attribute values and the values
    /// of its Text node children are to be translated when the page is localized, or whether to leave them unchanged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/translate)
    @discardableResult
    public func translate(_ value: State<Bool>) -> Self {
        value.listen { self.translate($0) }
        return self
    }
    
    /// Specify whether an element’s attribute values and the values
    /// of its Text node children are to be translated when the page is localized, or whether to leave them unchanged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/translate)
    @discardableResult
    public func translate<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        translate(expressable.unwrap())
    }
}

extension BaseElement: _TranslateAttrable {}
