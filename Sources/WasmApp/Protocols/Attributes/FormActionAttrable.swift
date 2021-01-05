//
//  FormActionAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol FormActionAttrable {
    @discardableResult
    func formAction(_ value: URLConformable) -> Self
    @discardableResult
    func formAction(_ value: State<URLConformable>) -> Self
    @discardableResult
    func formAction<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self
}

protocol _FormActionAttrable: _AnyElement, FormActionAttrable {}

extension FormActionAttrable {
    /// Indicates the action of the element, overriding the action defined in the <form>.
    ///
    /// Applicable to <button>, <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction(_ value: URLConformable) -> Self {
        guard let s = self as? _FormActionAttrable else { return self }
        s.domElement.formaction = value.stringValue.jsValue()
        return self
    }
    
    /// Indicates the action of the element, overriding the action defined in the <form>.
    ///
    /// Applicable to <button>, <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction(_ value: State<URLConformable>) -> Self {
        value.listen { self.formAction($0) }
        return self
    }
    
    /// Indicates the action of the element, overriding the action defined in the <form>.
    ///
    /// Applicable to <button>, <input>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction<V>(_ expressable: ExpressableState<V, URLConformable>) -> Self {
        formAction(expressable.unwrap())
    }
}

extension Button: _FormActionAttrable {}
extension InputSubmit: _FormActionAttrable {}
extension InputImage: _FormActionAttrable {}
