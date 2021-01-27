//
//  EncTypeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol EncTypeAttrable {
    @discardableResult
    func encType(_ value: EncType) -> Self
    @discardableResult
    func encType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType
}

protocol _EncTypeAttrable: _AnyElement, EncTypeAttrable {}

extension EncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType(_ value: EncType) -> Self {
        guard let s = self as? _EncTypeAttrable else { return self }
        s.setAttribute("enctype", value.value)
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

extension Form: _EncTypeAttrable {}
