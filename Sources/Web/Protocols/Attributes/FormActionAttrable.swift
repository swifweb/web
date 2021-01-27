//
//  FormActionAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol FormActionAttrable {
    @discardableResult
    func formAction<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func formAction<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

protocol _FormActionAttrable: _AnyElement, FormActionAttrable {}

extension FormActionAttrable {
    /// Indicates the action of the element, overriding the action defined in the `<form>`.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction<U: URLConformable>(_ value: U) -> Self {
        guard let s = self as? _FormActionAttrable else { return self }
        s.setAttribute("formaction", value.stringValue)
        return self
    }
    
    /// Indicates the action of the element, overriding the action defined in the `<form>`.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        formAction(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formAction($0) }
        return self
    }
}

extension Button: _FormActionAttrable {}
extension InputSubmit: _FormActionAttrable {}
extension InputImage: _FormActionAttrable {}
