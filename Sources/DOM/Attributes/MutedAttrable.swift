//
//  MutedAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol MutedAttrable: DOMElement {
    @discardableResult
    func muted(_ value: Bool) -> Self
    @discardableResult
    func muted<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension MutedAttrable {
    /// Indicates whether the audio will be initially silenced on page load.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_muted.asp)
    @discardableResult
    public func muted(_ value: Bool) -> Self {
        setAttribute("muted", value, .short)
        return self
    }
    
    /// Indicates whether the audio will be initially silenced on page load.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_muted.asp)
    @discardableResult
    public func muted<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        muted(value.stateValue.wrappedValue)
        value.stateValue.listen { self.muted($0) }
        return self
    }
}

extension Audio: MutedAttrable {}
extension Video: MutedAttrable {}
