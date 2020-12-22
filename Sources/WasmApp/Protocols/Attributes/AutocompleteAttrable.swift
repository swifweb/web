//
//  AutocompleteAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AutocompleteAttrable {
    @discardableResult
    func autocomplete(_ value: AutocompleteType) -> Self
    @discardableResult
    func autocomplete(_ value: State<AutocompleteType>) -> Self
    @discardableResult
    func autocomplete<V>(_ expressable: ExpressableState<V, AutocompleteType>) -> Self
}

protocol _AutocompleteAttrable: _AnyElement, AutocompleteAttrable {}

extension AutocompleteAttrable {
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to <form>, <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete(_ value: AutocompleteType) -> Self {
        guard let s = self as? _AutocompleteAttrable else { return self }
        s.domElement.autocapitalize = value.value.jsValue()
        return self
    }
    
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to <form>, <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete(_ value: State<AutocompleteType>) -> Self {
        value.listen { self.autocomplete($0) }
        return self
    }
    
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to <form>, <input>, <select>, <textarea>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete<V>(_ expressable: ExpressableState<V, AutocompleteType>) -> Self {
        autocomplete(expressable.unwrap())
    }
}

extension Form: _AutocompleteAttrable {}
extension Input: _AutocompleteAttrable {}
extension Select: _AutocompleteAttrable {}
extension TextArea: _AutocompleteAttrable {}
