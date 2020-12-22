//
//  ReversedAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ReversedAttrable {
    @discardableResult
    func reversed(_ value: Bool) -> Self
    @discardableResult
    func reversed(_ value: State<Bool>) -> Self
    @discardableResult
    func reversed<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _ReversedAttrable: _AnyElement, ReversedAttrable {}

extension ReversedAttrable {
    /// Indicates whether the list should be displayed in a descending order instead of a ascending.
    ///
    /// Applicable to <ol>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_reversed.asp)
    @discardableResult
    public func reversed(_ value: Bool) -> Self {
        guard let s = self as? _ReversedAttrable else { return self }
        s.domElement.reversed = value.jsValue()
        return self
    }
    
    /// Indicates whether the list should be displayed in a descending order instead of a ascending.
    ///
    /// Applicable to <ol>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_reversed.asp)
    @discardableResult
    public func reversed(_ value: State<Bool>) -> Self {
        value.listen { self.reversed($0) }
        return self
    }
    
    /// Indicates whether the list should be displayed in a descending order instead of a ascending.
    ///
    /// Applicable to <ol>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_reversed.asp)
    @discardableResult
    public func reversed<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        reversed(expressable.unwrap())
    }
}

extension Ol: _ReadOnlyAttrable {}
