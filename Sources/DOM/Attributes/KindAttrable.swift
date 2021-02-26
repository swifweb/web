//
//  KindAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol KindAttrable: DOMElement {
    @discardableResult
    func kind(_ value: String) -> Self
    @discardableResult
    func kind<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension KindAttrable {
    /// Specifies the kind of text track.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_kind.asp)
    @discardableResult
    public func kind(_ value: String) -> Self {
        setAttribute("kind", value)
        return self
    }
    
    /// Specifies the kind of text track.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_kind.asp)
    @discardableResult
    public func kind<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        kind(value.stateValue.wrappedValue)
        value.stateValue.listen { self.kind($0) }
        return self
    }
}

extension Track: KindAttrable {}
