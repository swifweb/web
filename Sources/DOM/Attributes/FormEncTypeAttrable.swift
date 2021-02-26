//
//  FormEncTypeAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol FormEncTypeAttrable: DOMElement {
    @discardableResult
    func formEncType(_ value: EncType) -> Self
    @discardableResult
    func formEncType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType
}

extension FormEncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formenctype.asp)
    @discardableResult
    public func formEncType(_ value: EncType) -> Self {
        setAttribute("formenctype", value.value)
        return self
    }
    
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formenctype.asp)
    @discardableResult
    public func formEncType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType {
        formEncType(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formEncType($0) }
        return self
    }
}

extension Button: FormEncTypeAttrable {}
extension InputSubmit: FormEncTypeAttrable {}
extension InputImage: FormEncTypeAttrable {}
