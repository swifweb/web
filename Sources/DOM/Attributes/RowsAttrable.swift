//
//  RowsAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol RowsAttrable: DOMElement {
    @discardableResult
    func rows(_ value: Int) -> Self
    @discardableResult
    func rows<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension RowsAttrable {
    /// Defines the number of rows in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rows)
    @discardableResult
    public func rows(_ value: Int) -> Self {
        setAttribute("rows", value)
        return self
    }
    
    /// Defines the number of rows in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rows)
    @discardableResult
    public func rows<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        rows(value.stateValue.wrappedValue)
        value.stateValue.listen { self.rows($0) }
        return self
    }
}

extension TextArea: RowsAttrable {}
