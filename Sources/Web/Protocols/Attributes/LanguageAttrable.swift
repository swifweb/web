//
//  LanguageAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LanguageAttrable {
    @discardableResult
    func language(_ value: String) -> Self
    @discardableResult
    func language<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _LanguageAttrable: _AnyElement, LanguageAttrable {}

extension LanguageAttrable {
    /// Defines the script language used in the element.
    ///
    /// Applicable to `<script>`
    @discardableResult
    public func language(_ value: String) -> Self {
        guard let s = self as? _LanguageAttrable else { return self }
        s.domElement.language = value.jsValue()
        return self
    }
    
    /// Defines the script language used in the element.
    ///
    /// Applicable to `<script>`
    @discardableResult
    public func language<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        language(value.stateValue.wrappedValue)
        value.stateValue.listen { self.language($0) }
        return self
    }
}

extension Script: _LanguageAttrable {}
