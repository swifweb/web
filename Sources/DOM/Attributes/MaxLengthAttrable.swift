//
//  MaxLengthAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MaxLengthAttrable: DOMElement {
    @discardableResult
    func maxlength(_ value: UInt) -> Self
    @discardableResult
    func maxlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt
}

extension MaxLengthAttrable {
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength(_ value: UInt) -> Self {
        setAttribute("maxlength", value)
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

extension InputText: MaxLengthAttrable {}
extension InputTel: MaxLengthAttrable {}
extension InputPassword: MaxLengthAttrable {}
extension InputSearch: MaxLengthAttrable {}
extension InputURL: MaxLengthAttrable {}
extension TextArea: MaxLengthAttrable {}
