//
//  MinLengthAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MinLengthAttrable: DOMElement {
    @discardableResult
    func minlength(_ value: UInt) -> Self
    @discardableResult
    func minlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt
}

extension MinLengthAttrable {
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength(_ value: UInt) -> Self {
        setAttribute("minlength", value)
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

extension InputText: MinLengthAttrable {}
extension InputTel: MinLengthAttrable {}
extension InputPassword: MinLengthAttrable {}
extension InputSearch: MinLengthAttrable {}
extension InputURL: MinLengthAttrable {}
extension TextArea: MinLengthAttrable {}
