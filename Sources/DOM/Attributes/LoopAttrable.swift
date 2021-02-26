//
//  LoopAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol LoopAttrable: DOMElement {
    @discardableResult
    func loop(_ value: Bool) -> Self
    @discardableResult
    func loop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension LoopAttrable {
    /// Indicates whether the media should start playing from the start when it's finished.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_loop.asp)
    @discardableResult
    public func loop(_ value: Bool) -> Self {
        setAttribute("loop", value, .short)
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

extension Audio: LoopAttrable {}
extension Video: LoopAttrable {}
