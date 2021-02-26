//
//  ReversedAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ReversedAttrable: DOMElement {
    @discardableResult
    func reversed(_ value: Bool) -> Self
    @discardableResult
    func reversed<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ReversedAttrable {
    /// Indicates whether the list should be displayed in a descending order instead of a ascending.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_reversed.asp)
    @discardableResult
    public func reversed(_ value: Bool) -> Self {
        setAttribute("reversed", value, .short)
        return self
    }
    
    /// Indicates whether the list should be displayed in a descending order instead of a ascending.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_reversed.asp)
    @discardableResult
    public func reversed<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        reversed(value.stateValue.wrappedValue)
        value.stateValue.listen { self.reversed($0) }
        return self
    }
}

extension Ol: ReadOnlyAttrable {}
