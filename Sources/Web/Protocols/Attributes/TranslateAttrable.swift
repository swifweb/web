//
//  TranslateAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol TranslateAttrable {
    @discardableResult
    func translate(_ value: Bool) -> Self
    @discardableResult
    func translate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
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
    public func translate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        translate(value.stateValue.wrappedValue)
        value.stateValue.listen { self.translate($0) }
        return self
    }
}

extension BaseElement: _TranslateAttrable {}
