//
//  FormEncTypeAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol FormEncTypeAttrable {
    @discardableResult
    func formEncType(_ value: EncType) -> Self
    @discardableResult
    func formEncType(_ value: State<EncType>) -> Self
    @discardableResult
    func formEncType<V>(_ expressable: ExpressableState<V, EncType>) -> Self
}

protocol _FormEncTypeAttrable: _AnyElement, FormEncTypeAttrable {}

extension FormEncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to <form>
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
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formenctype.asp)
    @discardableResult
    public func formEncType(_ value: State<EncType>) -> Self {
        value.listen { self.formEncType($0) }
        return self
    }
    
    /// If the button/input is a submit button (type="submit"),
    /// this attribute sets the encoding type to use during form submission.
    /// If this attribute is specified, it overrides the enctype attribute of the button's form owner.
    ///
    /// Applicable to <button>, <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formenctype.asp)
    @discardableResult
    public func formEncType<V>(_ expressable: ExpressableState<V, EncType>) -> Self {
        formEncType(expressable.unwrap())
    }
}

extension Button: _FormEncTypeAttrable {}
extension InputSubmit: _FormEncTypeAttrable {}
extension InputImage: _FormEncTypeAttrable {}
