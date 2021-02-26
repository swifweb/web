//
//  TypeAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol TypeAttrable: DOMElement {
    @discardableResult
    func type(_ value: String) -> Self
    @discardableResult
    func type<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension TypeAttrable {
    /// Defines the type of the element.
    ///
    /// Applicable to `<button>`, `<input>`, `<embed>`,
    /// `<object>`, `<script>`, `<source>`, `<style>`, `<menu>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_type.asp)
    @discardableResult
    public func type(_ value: String) -> Self {
        setAttribute("type", value)
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

extension Button: TypeAttrable {}
extension InputText: TypeAttrable {}
extension Embed: TypeAttrable {}
extension Object: TypeAttrable {}
extension Script: TypeAttrable {}
extension Source: TypeAttrable {}
extension Style: TypeAttrable {}
extension Menu: TypeAttrable {}
