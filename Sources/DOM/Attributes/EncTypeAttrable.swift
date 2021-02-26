//
//  EncTypeAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol EncTypeAttrable: DOMElement {
    @discardableResult
    func encType(_ value: EncType) -> Self
    @discardableResult
    func encType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType
}

extension EncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType(_ value: EncType) -> Self {
        setAttribute("enctype", value.value)
        return self
    }
    
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType {
        encType(value.stateValue.wrappedValue)
        value.stateValue.listen { self.encType($0) }
        return self
    }
}

extension Form: EncTypeAttrable {}
