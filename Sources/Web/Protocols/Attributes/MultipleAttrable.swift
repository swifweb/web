//
//  MultipleAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MultipleAttrable {
    @discardableResult
    func multiple(_ value: Bool) -> Self
    @discardableResult
    func multiple<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _MultipleAttrable: _AnyElement, MultipleAttrable {}

extension MultipleAttrable {
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to <input>, <select>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple(_ value: Bool) -> Self {
        guard let s = self as? _MultipleAttrable else { return self }
        s.domElement.multiple = value.jsValue()
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

extension InputEmail: _MultipleAttrable {}
extension InputFile: _MultipleAttrable {}
extension Select: _MultipleAttrable {}
