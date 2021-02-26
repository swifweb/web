//
//  FormActionAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol FormActionAttrable: DOMElement {
    @discardableResult
    func formAction<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func formAction<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension FormActionAttrable {
    /// Indicates the action of the element, overriding the action defined in the `<form>`.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction<U: URLConformable>(_ value: U) -> Self {
        setAttribute("formaction", value.stringValue)
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

extension Button: FormActionAttrable {}
extension InputSubmit: FormActionAttrable {}
extension InputImage: FormActionAttrable {}
