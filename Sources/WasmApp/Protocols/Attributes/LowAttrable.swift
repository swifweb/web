//
//  LowAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol LowAttrable {
    @discardableResult
    func low(_ value: Double) -> Self
    @discardableResult
    func low(_ value: State<Double>) -> Self
    @discardableResult
    func low<V>(_ expressable: ExpressableState<V, Double>) -> Self
}

protocol _LowAttrable: _AnyElement, LowAttrable {}

extension LowAttrable {
    /// Indicates the upper bound of the lower range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_low.asp)
    @discardableResult
    public func low(_ value: Double) -> Self {
        guard let s = self as? _LowAttrable else { return self }
        s.domElement.low = value.jsValue()
        return self
    }
    
    /// Indicates the upper bound of the lower range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_low.asp)
    @discardableResult
    public func low(_ value: State<Double>) -> Self {
        value.listen { self.low($0) }
        return self
    }
    
    /// Indicates the upper bound of the lower range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_low.asp)
    @discardableResult
    public func low<V>(_ expressable: ExpressableState<V, Double>) -> Self {
        low(expressable.unwrap())
    }
}

extension Meter: _LowAttrable {}
