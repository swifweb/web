//
//  DefaultAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol DefaultAttrable: DOMElement {
    @discardableResult
    func `default`(_ value: Bool) -> Self
    @discardableResult
    func `default`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension DefaultAttrable {
    /// Indicates that the track should be enabled unless the user's preferences indicate something different.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_default.asp)
    @discardableResult
    public func `default`(_ value: Bool) -> Self {
        setAttribute("default", value, .short)
        return self
    }
    
    /// Indicates that the track should be enabled unless the user's preferences indicate something different.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_default.asp)
    @discardableResult
    public func `default`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        `default`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`default`($0) }
        return self
    }
}

extension Track: DefaultAttrable {}
