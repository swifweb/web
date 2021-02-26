//
//  LanguageAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol LanguageAttrable: DOMElement {
    @discardableResult
    func language(_ value: String) -> Self
    @discardableResult
    func language<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension LanguageAttrable {
    /// Defines the script language used in the element.
    ///
    /// Applicable to `<script>`
    @discardableResult
    public func language(_ value: String) -> Self {
        setAttribute("language", value)
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

extension Script: LanguageAttrable {}
