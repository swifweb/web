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
    func muted(_ value: State<Bool>) -> Self
    @discardableResult
    func muted<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _MutedAttrable: _AnyElement, MutedAttrable {}

extension MutedAttrable {
    /// Indicates whether the audio will be initially silenced on page load.
    ///
    /// Applicable to <audio>, <video>
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
    /// Applicable to <audio>, <video>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_muted.asp)
    @discardableResult
    public func muted(_ value: State<Bool>) -> Self {
        value.listen { self.muted($0) }
        return self
    }
    
    /// Indicates whether the audio will be initially silenced on page load.
    ///
    /// Applicable to <audio>, <video>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_muted.asp)
    @discardableResult
    public func muted<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        muted(expressable.unwrap())
    }
}

extension Audio: _MutedAttrable {}
extension Video: _MutedAttrable {}
