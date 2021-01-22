//
//  MaxLengthAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MaxLengthAttrable {
    @discardableResult
    func maxlength(_ value: UInt) -> Self
    @discardableResult
    func maxlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt
}

protocol _MaxLengthAttrable: _AnyElement, MaxLengthAttrable {}

extension MaxLengthAttrable {
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength(_ value: UInt) -> Self {
        guard let s = self as? _MaxLengthAttrable else { return self }
        s.domElement.maxlength = value.jsValue()
        return self
    }
    
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt {
        maxlength(value.stateValue.wrappedValue)
        value.stateValue.listen { self.maxlength($0) }
        return self
    }
}

extension InputText: _MaxLengthAttrable {}
extension InputTel: _MaxLengthAttrable {}
extension InputPassword: _MaxLengthAttrable {}
extension InputSearch: _MaxLengthAttrable {}
extension InputURL: _MaxLengthAttrable {}
extension TextArea: _MaxLengthAttrable {}
