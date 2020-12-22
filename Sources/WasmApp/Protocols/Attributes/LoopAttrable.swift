//
//  LoopAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LoopAttrable {
    @discardableResult
    func loop(_ value: Bool) -> Self
    @discardableResult
    func loop(_ value: State<Bool>) -> Self
    @discardableResult
    func loop<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _LoopAttrable: _AnyElement, LoopAttrable {}

extension LoopAttrable {
    /// Indicates whether the media should start playing from the start when it's finished.
    ///
    /// Applicable to <audio>, <video>
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
    /// Applicable to <audio>, <video>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_loop.asp)
    @discardableResult
    public func loop(_ value: State<Bool>) -> Self {
        value.listen { self.loop($0) }
        return self
    }
    
    /// Indicates whether the media should start playing from the start when it's finished.
    ///
    /// Applicable to <audio>, <video>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_loop.asp)
    @discardableResult
    public func loop<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        loop(expressable.unwrap())
    }
}

extension Audio: _LoopAttrable {}
extension Video: _LoopAttrable {}
