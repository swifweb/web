//
//  LabelAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol LabelAttrable: DOMElement {
    @discardableResult
    func label(_ value: String) -> Self
    @discardableResult
    func label<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension LabelAttrable {
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to `<optgroup>`, `<option>`, `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label(_ value: String) -> Self {
        setAttribute("label", value)
        return self
    }
    
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to `<optgroup>`, `<option>`, `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        label(value.stateValue.wrappedValue)
        value.stateValue.listen { self.label($0) }
        return self
    }
}

extension OptGroup: LabelAttrable {}
extension Option: LabelAttrable {}
extension Track: LabelAttrable {}
