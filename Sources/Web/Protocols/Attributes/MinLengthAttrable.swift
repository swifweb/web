//
//  MinLengthAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MinLengthAttrable {
    @discardableResult
    func minlength(_ value: UInt) -> Self
    @discardableResult
    func minlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt
}

protocol _MinLengthAttrable: _AnyElement, MinLengthAttrable {}

extension MinLengthAttrable {
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength(_ value: UInt) -> Self {
        guard let s = self as? _MinLengthAttrable else { return self }
        s.setAttribute("minlength", value)
        return self
    }
    
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt {
        minlength(value.stateValue.wrappedValue)
        value.stateValue.listen { self.minlength($0) }
        return self
    }
}

extension InputText: _MinLengthAttrable {}
extension InputTel: _MinLengthAttrable {}
extension InputPassword: _MinLengthAttrable {}
extension InputSearch: _MinLengthAttrable {}
extension InputURL: _MinLengthAttrable {}
extension TextArea: _MinLengthAttrable {}
