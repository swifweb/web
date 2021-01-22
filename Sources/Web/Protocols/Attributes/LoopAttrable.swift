//
//  LoopAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LoopAttrable {
    @discardableResult
    func loop(_ value: Bool) -> Self
    @discardableResult
    func loop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _LoopAttrable: _AnyElement, LoopAttrable {}

extension LoopAttrable {
    /// Indicates whether the media should start playing from the start when it's finished.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_loop.asp)
    @discardableResult
    public func loop(_ value: Bool) -> Self {
        guard let s = self as? _LoopAttrable else { return self }
        s.domElement.loop = value.jsValue()
        return self
    }
    
    /// Indicates whether the media should start playing from the start when it's finished.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_loop.asp)
    @discardableResult
    public func loop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        loop(value.stateValue.wrappedValue)
        value.stateValue.listen { self.loop($0) }
        return self
    }
}

extension Audio: _LoopAttrable {}
extension Video: _LoopAttrable {}
