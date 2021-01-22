//
//  FormEncTypeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol FormEncTypeAttrable {
    @discardableResult
    func formEncType(_ value: EncType) -> Self
    @discardableResult
    func formEncType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType
}

protocol _FormEncTypeAttrable: _AnyElement, FormEncTypeAttrable {}

extension FormEncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formenctype.asp)
    @discardableResult
    public func formEncType(_ value: EncType) -> Self {
        guard let s = self as? _EncTypeAttrable else { return self }
        s.domElement.formenctype = value.value.jsValue()
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

extension Button: _FormEncTypeAttrable {}
extension InputSubmit: _FormEncTypeAttrable {}
extension InputImage: _FormEncTypeAttrable {}
