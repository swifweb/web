//
//  LabelAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LabelAttrable {
    @discardableResult
    func label(_ value: String) -> Self
    @discardableResult
    func label<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _LabelAttrable: _AnyElement, LabelAttrable {}

extension LabelAttrable {
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to `<optgroup>`, `<option>`, `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label(_ value: String) -> Self {
        guard let s = self as? _LabelAttrable else { return self }
        s.domElement.label = value.jsValue()
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

extension OptGroup: _LabelAttrable {}
extension Option: _LabelAttrable {}
extension Track: _LabelAttrable {}
