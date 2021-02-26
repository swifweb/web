//
//  MultipleAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MultipleAttrable: DOMElement {
    @discardableResult
    func multiple(_ value: Bool) -> Self
    @discardableResult
    func multiple<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension MultipleAttrable {
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple(_ value: Bool) -> Self {
        setAttribute("multiple", value, .short)
        return self
    }
    
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        multiple(value.stateValue.wrappedValue)
        value.stateValue.listen { self.multiple($0) }
        return self
    }
}

extension InputEmail: MultipleAttrable {}
extension InputFile: MultipleAttrable {}
extension Select: MultipleAttrable {}
