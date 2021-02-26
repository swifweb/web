//
//  SizeAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SizeAttrable: DOMElement {
    @discardableResult
    func size(_ value: Int) -> Self
    @discardableResult
    func size<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension SizeAttrable {
    /// The size attribute defines the width of the `<input>` and the height of the `<select>` element.
    ///
    /// For the input, if the type attribute is text or password then it's the number of characters.
    /// This must be an integer value 0 or higher.
    /// If no size is specified, or an invalid value is specified, the input has no size declared,
    /// and the form control will be the default width based on the user agent.
    /// If CSS targets the element with properties impacting the width, CSS takes precedence.
    ///
    /// The size attribute has no impact on constraint validation.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/size)
    @discardableResult
    public func size(_ value: Int) -> Self {
        setAttribute("size", value)
        return self
    }
    
    /// The size attribute defines the width of the `<input>` and the height of the `<select>` element.
    ///
    /// For the input, if the type attribute is text or password then it's the number of characters.
    /// This must be an integer value 0 or higher.
    /// If no size is specified, or an invalid value is specified, the input has no size declared,
    /// and the form control will be the default width based on the user agent.
    /// If CSS targets the element with properties impacting the width, CSS takes precedence.
    ///
    /// The size attribute has no impact on constraint validation.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/size)
    @discardableResult
    public func size<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        size(value.stateValue.wrappedValue)
        value.stateValue.listen { self.size($0) }
        return self
    }
}

extension InputText: SizeAttrable {}
extension InputTel: SizeAttrable {}
extension InputEmail: SizeAttrable {}
extension InputPassword: SizeAttrable {}
extension Select: SizeAttrable {}
