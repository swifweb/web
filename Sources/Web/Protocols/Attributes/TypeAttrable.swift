//
//  TypeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol TypeAttrable {
    @discardableResult
    func type(_ value: String) -> Self
    @discardableResult
    func type<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _TypeAttrable: _AnyElement, TypeAttrable {}

extension TypeAttrable {
    /// Defines the type of the element.
    ///
    /// Applicable to `<button>`, `<input>`, `<embed>`,
    /// `<object>`, `<script>`, `<source>`, `<style>`, `<menu>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_type.asp)
    @discardableResult
    public func type(_ value: String) -> Self {
        guard let s = self as? _TypeAttrable else { return self }
        s.domElement.type = value.jsValue()
        return self
    }
    
    /// Defines the type of the element.
    ///
    /// Applicable to `<button>`, `<input>`, `<embed>`,
    /// `<object>`, `<script>`, `<source>`, `<style>`, `<menu>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_type.asp)
    @discardableResult
    public func type<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        type(value.stateValue.wrappedValue)
        value.stateValue.listen { self.type($0) }
        return self
    }
}

extension Button: _TypeAttrable {}
extension InputText: _TypeAttrable {}
extension Embed: _TypeAttrable {}
extension Object: _TypeAttrable {}
extension Script: _TypeAttrable {}
extension Source: _TypeAttrable {}
extension Style: _TypeAttrable {}
extension Menu: _TypeAttrable {}
