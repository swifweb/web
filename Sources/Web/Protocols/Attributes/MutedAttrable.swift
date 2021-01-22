//
//  MutedAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MutedAttrable {
    @discardableResult
    func muted(_ value: Bool) -> Self
    @discardableResult
    func muted<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _MutedAttrable: _AnyElement, MutedAttrable {}

extension MutedAttrable {
    /// Indicates whether the audio will be initially silenced on page load.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_muted.asp)
    @discardableResult
    public func muted(_ value: Bool) -> Self {
        guard let s = self as? _MutedAttrable else { return self }
        s.domElement.muted = value.jsValue()
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

extension Audio: _MutedAttrable {}
extension Video: _MutedAttrable {}
