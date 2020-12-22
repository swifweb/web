//
//  DefaultAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DefaultAttrable {
    @discardableResult
    func `default`(_ value: Bool) -> Self
    @discardableResult
    func `default`(_ value: State<Bool>) -> Self
    @discardableResult
    func `default`<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _DefaultAttrable: _AnyElement, DefaultAttrable {}

extension DefaultAttrable {
    /// Indicates that the track should be enabled unless the user's preferences indicate something different.
    ///
    /// Applicable to <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_default.asp)
    @discardableResult
    public func `default`(_ value: Bool) -> Self {
        guard let s = self as? _DefaultAttrable else { return self }
        s.domElement.default = value.jsValue()
        return self
    }
    
    /// Indicates that the track should be enabled unless the user's preferences indicate something different.
    ///
    /// Applicable to <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_default.asp)
    @discardableResult
    public func `default`(_ value: State<Bool>) -> Self {
        value.listen { self.`default`($0) }
        return self
    }
    
    /// Indicates that the track should be enabled unless the user's preferences indicate something different.
    ///
    /// Applicable to <track>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_default.asp)
    @discardableResult
    public func `default`<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        `default`(expressable.unwrap())
    }
}

extension Track: _DefaultAttrable {}
