//
//  OptimumAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol OptimumAttrable {
    @discardableResult
    func optimum(_ value: Double) -> Self
    @discardableResult
    func optimum(_ value: State<Double>) -> Self
    @discardableResult
    func optimum<V>(_ expressable: ExpressableState<V, Double>) -> Self
}

protocol _OptimumAttrable: _AnyElement, OptimumAttrable {}

extension OptimumAttrable {
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_optimum.asp)
    @discardableResult
    public func optimum(_ value: Double) -> Self {
        guard let s = self as? _OptimumAttrable else { return self }
        s.domElement.optimum = value.jsValue()
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_optimum.asp)
    @discardableResult
    public func optimum(_ value: State<Double>) -> Self {
        value.listen { self.optimum($0) }
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to <meter>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_optimum.asp)
    @discardableResult
    public func optimum<V>(_ expressable: ExpressableState<V, Double>) -> Self {
        optimum(expressable.unwrap())
    }
}

extension Meter: _OptimumAttrable {}
