//
//  MaxAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol MaxAttrable {
    @discardableResult
    func max(_ value: Double) -> Self
    @discardableResult
    func max(_ value: State<Double>) -> Self
    @discardableResult
    func max<V>(_ expressable: ExpressableState<V, Double>) -> Self
}

protocol _MaxAttrable: _AnyElement, MaxAttrable {}

extension MaxAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: Double) -> Self {
        guard let s = self as? _MaxAttrable else { return self }
        s.domElement.max = value.jsValue()
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: State<Double>) -> Self {
        value.listen { self.max($0) }
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to <input>, <meter>, <progress>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max<V>(_ expressable: ExpressableState<V, Double>) -> Self {
        max(expressable.unwrap())
    }
}

extension Input: _MaxAttrable {}
extension Meter: _MaxAttrable {}
extension Progress: _MaxAttrable {}
